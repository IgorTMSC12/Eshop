package by.teachmeskills.eshop.services;

import by.teachmeskills.eshop.entities.Category;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import java.io.Writer;

public interface CategoryService extends BaseRepository<Category> {

    public ModelAndView getAllCategories(int pageNumber, int pageSize);

    public void exportToFile(Writer writer);

    public void importFromFile(MultipartFile file);
}
