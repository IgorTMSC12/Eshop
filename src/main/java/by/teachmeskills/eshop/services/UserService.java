package by.teachmeskills.eshop.services;

import by.teachmeskills.eshop.entities.User;
import org.springframework.web.servlet.ModelAndView;

import java.io.Writer;

public interface UserService extends BaseRepository<User> {

    public ModelAndView register(User user);

    public ModelAndView getUserCabinet();

    public void exportToFile(Writer writer);
}
