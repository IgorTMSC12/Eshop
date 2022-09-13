package by.teachmeskills.eshop.exceptions;

import by.teachmeskills.eshop.PagesPathEnum;
import org.springframework.http.HttpStatus;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.servlet.ModelAndView;

@ControllerAdvice
public class GlobalControllerExceptionHandler {

    @ResponseStatus(HttpStatus.FORBIDDEN)
    @ExceptionHandler(AuthorizationException.class)
    public ModelAndView handleAuthException(Exception exception) {
        ModelMap modelMap = new ModelMap();
        modelMap.addAttribute("error", exception.getMessage());
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName(PagesPathEnum.ERROR_PAGE.getPath());
        modelAndView.addAllObjects(modelMap);
        return modelAndView;
    }
}
