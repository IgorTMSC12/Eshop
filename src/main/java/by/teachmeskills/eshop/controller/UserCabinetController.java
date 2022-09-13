package by.teachmeskills.eshop.controller;

import by.teachmeskills.eshop.services.impl.UserServiceImpl;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@RestController
@RequestMapping("/cabinet")
public class UserCabinetController {
    private UserServiceImpl userService;

    public UserCabinetController(UserServiceImpl userService) {
        this.userService = userService;
    }

    @GetMapping
    public ModelAndView openUserCabinet() {
        return userService.getUserCabinet();
    }

    @GetMapping("/export")
    public ModelAndView exportToFile(HttpServletResponse response) throws IOException {
        response.setContentType("text/csv");
        response.setCharacterEncoding("UTF8");
        response.addHeader("Content-Disposition", "attachment; filename=userOrders.csv");
        userService.exportToFile(response.getWriter());
        return openUserCabinet();
    }
}
