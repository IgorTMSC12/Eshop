package by.teachmeskills.eshop.controller;

import by.teachmeskills.eshop.PagesPathEnum;
import by.teachmeskills.eshop.entities.User;
import by.teachmeskills.eshop.services.impl.UserServiceImpl;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

@RestController
@RequestMapping("/registration")
public class RegistrationController {
    private UserServiceImpl userService;

    public RegistrationController(UserServiceImpl userService) {
        this.userService = userService;
    }

    @GetMapping
    public ModelAndView openRegistrationPage() {
        return new ModelAndView(PagesPathEnum.REGISTER_PAGE.getPath());
    }

    @PostMapping
    public ModelAndView registerNewUser(@ModelAttribute("user") User user) {
        return userService.register(user);
    }
}
