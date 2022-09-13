package by.teachmeskills.eshop.controller;

import by.teachmeskills.eshop.dto.SearchParamsDto;
import by.teachmeskills.eshop.services.impl.ProductServiceImpl;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

@RestController
@RequestMapping("/search")
public class SearchController {
    private ProductServiceImpl productService;

    public SearchController(ProductServiceImpl productService){
        this.productService = productService;
    }

    @PostMapping()
    public ModelAndView getSearchPage(@ModelAttribute SearchParamsDto searchParamsDto,
                                      @RequestParam(value = "pageNumber", defaultValue = "0") int pageNumber,
                                      @RequestParam(value = "pageSize", defaultValue = "10") int pageSize) {
        return productService.findAllProductsByRequest(searchParamsDto, pageNumber, pageSize);
    }

    @GetMapping
    public ModelAndView getNextSearchPage(@ModelAttribute SearchParamsDto searchParamsDto,
                                          @RequestParam(value = "pageNumber", defaultValue = "0") int pageNumber,
                                          @RequestParam(value = "pageSize", defaultValue = "10") int pageSize) {
        return productService.findAllProductsByRequest(searchParamsDto, pageNumber, pageSize);
    }
}
