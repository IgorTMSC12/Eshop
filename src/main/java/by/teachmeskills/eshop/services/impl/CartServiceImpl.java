package by.teachmeskills.eshop.services.impl;

import by.teachmeskills.eshop.PagesPathEnum;
import by.teachmeskills.eshop.entities.Cart;
import by.teachmeskills.eshop.entities.Image;
import by.teachmeskills.eshop.entities.Order;
import by.teachmeskills.eshop.entities.Product;
import by.teachmeskills.eshop.entities.User;
import by.teachmeskills.eshop.repositories.ImageRepository;
import by.teachmeskills.eshop.repositories.OrderRepository;
import by.teachmeskills.eshop.repositories.ProductRepository;
import by.teachmeskills.eshop.repositories.UserRepository;
import by.teachmeskills.eshop.services.CartService;
import lombok.extern.log4j.Log4j;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;
import org.springframework.ui.ModelMap;
import org.springframework.web.servlet.ModelAndView;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

@Log4j
@Service
public class CartServiceImpl implements CartService {
    private ImageRepository imageRepository;
    private ProductRepository productRepository;
    private OrderRepository orderRepository;
    private UserRepository userRepository;

    public CartServiceImpl(ImageRepository imageRepository, ProductRepository productRepository,
                           OrderRepository orderRepository, UserRepository userRepository) {
        this.imageRepository = imageRepository;
        this.productRepository = productRepository;
        this.orderRepository = orderRepository;
        this.userRepository = userRepository;
    }

    @Override
    public ModelAndView getCartPage(Cart cart) {
        ModelMap modelMap = new ModelMap();
        List<Image> images = getImagesProduct(cart);
        modelMap.addAttribute("cart", cart);
        modelMap.addAttribute("images", images);
        return new ModelAndView(PagesPathEnum.CART_PAGE.getPath(), modelMap);
    }

    @Override
    public ModelAndView addProductToCart(int productId, Cart cart) {
        ModelMap modelMap = new ModelMap();
        Product product = productRepository.getProductById(productId);
        Image image = imageRepository.getImageByProductId(productId);
        cart.addProduct(product);
        modelMap.addAttribute("product", product);
        modelMap.addAttribute("image", image);
        return new ModelAndView(PagesPathEnum.PRODUCT_PAGE.getPath(), modelMap);
    }

    @Override
    public ModelAndView deleteProductToCart(int productId, Cart cart) {
        ModelMap modelMap = new ModelMap();
        Product product = productRepository.getProductById(productId);
        cart.removeProduct(product);
        List<Image> images = getImagesProduct(cart);
        modelMap.addAttribute("cart", cart);
        modelMap.addAttribute("images", images);
        return new ModelAndView(PagesPathEnum.CART_PAGE.getPath(), modelMap);
    }

    @Override
    public ModelAndView createOrder(Cart cart) {
        ModelMap modelMap = new ModelMap();
        String userEmail = SecurityContextHolder.getContext().getAuthentication().getName();
        User user = userRepository.getByEmail(userEmail);
        LocalDate date = LocalDate.now();
        Order order = Order.builder()
                .user(user)
                .orderPrice(cart.getProductsPrice())
                .orderData(date)
                .products(cart.getProducts())
                .build();
        orderRepository.save(order);
        cart.clear();
        modelMap.addAttribute("cart", cart);
        log.info("Пользователь c id = " + user.getId() + " оформил заказ.");
        return new ModelAndView(PagesPathEnum.CART_PAGE.getPath(), modelMap);
    }

    private List<Image> getImagesProduct(Cart cart) {
        List<Image> images = new ArrayList<>();
        if(!(cart.getProducts() == null)) {
            for (Product product : cart.getProducts()) {
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
        return images;
    }
}
