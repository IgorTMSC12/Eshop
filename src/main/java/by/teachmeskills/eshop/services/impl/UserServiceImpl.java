package by.teachmeskills.eshop.services.impl;

import by.teachmeskills.eshop.PagesPathEnum;
import by.teachmeskills.eshop.entities.Image;
import by.teachmeskills.eshop.entities.Order;
import by.teachmeskills.eshop.entities.Product;
import by.teachmeskills.eshop.entities.Role;
import by.teachmeskills.eshop.entities.User;
import by.teachmeskills.eshop.repositories.ImageRepository;
import by.teachmeskills.eshop.repositories.OrderRepository;
import by.teachmeskills.eshop.repositories.RoleRepository;
import by.teachmeskills.eshop.repositories.UserRepository;
import by.teachmeskills.eshop.services.UserService;
import com.opencsv.CSVWriter;
import com.opencsv.bean.StatefulBeanToCsv;
import com.opencsv.bean.StatefulBeanToCsvBuilder;
import com.opencsv.exceptions.CsvDataTypeMismatchException;
import com.opencsv.exceptions.CsvRequiredFieldEmptyException;
import lombok.extern.log4j.Log4j;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.ui.ModelMap;
import org.springframework.web.servlet.ModelAndView;

import java.io.Writer;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Log4j
@Service
public class UserServiceImpl implements UserService {
    private UserRepository userRepository;
    private ImageRepository imageRepository;
    private OrderRepository orderRepository;
    private PasswordEncoder passwordEncoder;
    private RoleRepository roleRepository;

    public UserServiceImpl(UserRepository userRepository, ImageRepository imageRepository,
                           OrderRepository orderRepository, PasswordEncoder passwordEncoder,
                           RoleRepository roleRepository) {
        this.userRepository = userRepository;
        this.imageRepository = imageRepository;
        this.orderRepository = orderRepository;
        this.passwordEncoder = passwordEncoder;
        this.roleRepository = roleRepository;
    }

    @Override
    public void create(User entity) {
        entity.setPassword(passwordEncoder.encode(entity.getPassword()));
        userRepository.save(entity);
    }

    @Override
    public List read() {
        return userRepository.findAll();
    }

    @Override
    public void update(User entity) {
        userRepository.save(entity);
    }

    @Override
    public void delete(int id) {
        userRepository.deleteById(id);
    }

    @Override
    public ModelAndView register(User user) {
        ModelAndView modelAndView = new ModelAndView();
        if(Optional.ofNullable(user.getName()).isPresent() && Optional.ofNullable(user.getLastName()).isPresent() &&
                Optional.ofNullable(user.getEmail()).isPresent() && Optional.ofNullable(user.getPassword()).isPresent()) {
            Role role = roleRepository.getRoleById(2);
            user.setRole(role);
            if(!(checkUserFromBase(user))) {
                create(user);
                modelAndView.setViewName(PagesPathEnum.SIGN_IN_PAGE.getPath());
            } else {
                modelAndView.setViewName(PagesPathEnum.REGISTER_PAGE.getPath());
            }
        } else {
            modelAndView.setViewName(PagesPathEnum.REGISTER_PAGE.getPath());
        }
        return modelAndView;
    }

    @Override
    public ModelAndView getUserCabinet(){
        ModelMap modelMap = new ModelMap();
        String userEmail = SecurityContextHolder.getContext().getAuthentication().getName();
        User user = userRepository.getByEmail(userEmail);
        ArrayList<Order> orders = (ArrayList<Order>) orderRepository.getOrdersByUserId(user.getId());
        List<Image> images = new ArrayList<>();
        for (Order order : orders) {
            for (Product product : order.getProducts()) {
                Image image = imageRepository.getImageByProductId(product.getId());
                if (images.size() == 0) {
                    images.add(image);
                }
                int count = 0;
                for (int i = 0; i < images.size(); i++) {
                    if (!(images.get(i).getProduct().getId() == image.getProduct().getId())) {
                        count++;
                    }
                    if (count == images.size()) {
                        images.add(image);
                    }
                }
            }
        }
        modelMap.addAttribute("user", user);
        modelMap.addAttribute("orders", orders);
        modelMap.addAttribute("images", images);
        return new ModelAndView(PagesPathEnum.USER_CABINET_PAGE.getPath(), modelMap);
    }

    @Override
    public void exportToFile(Writer writer) {
        User user = null;
        try{
            List<Order> orders = orderRepository.getOrdersByUserId(user.getId());
            StatefulBeanToCsv statefulBeanToCsv = new StatefulBeanToCsvBuilder(writer)
                    .withQuotechar(CSVWriter.NO_QUOTE_CHARACTER).build();
            statefulBeanToCsv.write(orders);
        } catch (CsvDataTypeMismatchException | CsvRequiredFieldEmptyException exception) {
            log.error(exception.getMessage());
        }
    }

    public boolean checkUserFromBase(User user) {
        List<User> users = read();
        for (int i = 0; i < users.size(); i++) {
            if(users.get(i).getEmail().equals(user.getEmail()) && users.get(i).getPassword().equals(user.getPassword())) {
                return true;
            }
        }
        return false;
    }
}
