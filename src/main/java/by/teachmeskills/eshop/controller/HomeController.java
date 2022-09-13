package by.teachmeskills.eshop.controller;

import by.teachmeskills.eshop.services.impl.CategoryServiceImpl;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@RestController
@RequestMapping("/home")
public class HomeController {
    private CategoryServiceImpl categoryService;

    public HomeController(CategoryServiceImpl categoryService) {
        this.categoryService = categoryService;
    }

    @GetMapping
    public ModelAndView getHomePage(@RequestParam(value = "pageNumber", defaultValue = "0") int pageNumber,
                                    @RequestParam(value = "pageSize", defaultValue = "8") int pageSize) {
        return categoryService.getAllCategories(pageNumber, pageSize);
    }

    @GetMapping("/export")
    public ModelAndView exportToFile(HttpServletResponse response,
                                     @RequestParam(value = "pageNumber", defaultValue = "0") int pageNumber,
                                     @RequestParam(value = "pageSize", defaultValue = "8") int pageSize) throws IOException {
        response.setContentType("text/csv");
        response.setCharacterEncoding("UTF8");
        response.addHeader("Content-Disposition", "attachment; filename=categories.csv");
        categoryService.exportToFile(response.getWriter());
        return categoryService.getAllCategories(pageNumber, pageSize);
    }

    @PostMapping("/import")
    public ModelAndView importFromFile(@RequestParam("file") MultipartFile file,
                                       @RequestParam(value = "pageNumber", defaultValue = "0") int pageNumber,
                                       @RequestParam(value = "pageSize", defaultValue = "8") int pageSize) {
        categoryService.importFromFile(file);
        return categoryService.getAllCategories(pageNumber, pageSize);
    }
}
