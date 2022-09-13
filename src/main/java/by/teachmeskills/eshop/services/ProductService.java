package by.teachmeskills.eshop.services;

import by.teachmeskills.eshop.dto.SearchParamsDto;
import by.teachmeskills.eshop.entities.Product;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import java.io.Writer;

public interface ProductService extends BaseRepository<Product> {

    public ModelAndView getCategoryPage(int id, int pageNumber, int pageSize);

    public ModelAndView getProductPage(int id);

    public ModelAndView findAllProductsByRequest(SearchParamsDto searchParamsDto, int pageNumber, int pageSize);

    public void exportToFile(Writer writer, int categoryId);

    public void importFromFile(MultipartFile file, int categoryId);
}
