package by.teachmeskills.eshop.controller;

import by.teachmeskills.eshop.services.impl.ProductServiceImpl;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

@RestController
@RequestMapping("/product")
public class ProductController {

    private ProductServiceImpl productService;

    public ProductController(ProductServiceImpl productService) {
        this.productService = productService;
    }

    @GetMapping
    public ModelAndView openProductPage(@RequestParam("productId") int productId) {
        return productService.getProductPage(productId);
    }
}
