package by.teachmeskills.eshop.controller;

import by.teachmeskills.eshop.services.impl.ProductServiceImpl;
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
@RequestMapping("/category")
public class CategoryController {
    private ProductServiceImpl productService;

    public CategoryController(ProductServiceImpl productService) {
        this.productService = productService;
    }

    @GetMapping
    public ModelAndView openCategoryPage(@RequestParam("categoryId") int categoryId,
                                         @RequestParam(value = "pageNumber", defaultValue = "0") int pageNumber,
                                         @RequestParam(value = "pageSize", defaultValue = "10") int pageSize) {
        return productService.getCategoryPage(categoryId, pageNumber, pageSize);
    }

    @GetMapping("/export")
    public ModelAndView exportToFile(HttpServletResponse response,
                                     @RequestParam("categoryId") int categoryId,
                                     @RequestParam(value = "pageNumber", defaultValue = "0") int pageNumber,
                                     @RequestParam(value = "pageSize", defaultValue = "10") int pageSize) throws IOException {
        response.setContentType("text/csv");
        response.setCharacterEncoding("UTF8");
        response.addHeader("Content-Disposition", "attachment; filename=products.csv");
        productService.exportToFile(response.getWriter(), categoryId);
        return openCategoryPage(categoryId, pageNumber, pageSize);
    }

    @PostMapping("/import")
    public ModelAndView importFromFile(@RequestParam("file") MultipartFile file,
                                       @RequestParam("categoryId") int categoryId,
                                       @RequestParam(value = "pageNumber", defaultValue = "0") int pageNumber,
                                       @RequestParam(value = "pageSize", defaultValue = "10") int pageSize) {
        productService.importFromFile(file, categoryId);
        return openCategoryPage(categoryId, pageNumber, pageSize);
    }
}
