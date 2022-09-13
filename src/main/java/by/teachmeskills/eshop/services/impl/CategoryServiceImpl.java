package by.teachmeskills.eshop.services.impl;

import by.teachmeskills.eshop.PagesPathEnum;
import by.teachmeskills.eshop.entities.Category;
import by.teachmeskills.eshop.entities.Image;
import by.teachmeskills.eshop.repositories.CategoryRepository;
import by.teachmeskills.eshop.repositories.ImageRepository;
import by.teachmeskills.eshop.services.CategoryService;
import com.opencsv.CSVWriter;
import com.opencsv.bean.CsvToBean;
import com.opencsv.bean.CsvToBeanBuilder;
import com.opencsv.bean.StatefulBeanToCsv;
import com.opencsv.bean.StatefulBeanToCsvBuilder;
import com.opencsv.exceptions.CsvDataTypeMismatchException;
import com.opencsv.exceptions.CsvRequiredFieldEmptyException;
import lombok.extern.log4j.Log4j;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import org.springframework.ui.ModelMap;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.Reader;
import java.io.Writer;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Log4j
@Service
public class CategoryServiceImpl implements CategoryService {

    private CategoryRepository categoryRepository;
    private ImageRepository imageRepository;

    public CategoryServiceImpl(CategoryRepository categoryRepository, ImageRepository imageRepository){
        this.categoryRepository = categoryRepository;
        this.imageRepository = imageRepository;
    }

    @Override
    public void create(Category entity) {
        categoryRepository.save(entity);
    }

    @Override
    public List<Category> read() {
        return categoryRepository.findAll();
    }

    @Override
    public void update(Category entity) {
        categoryRepository.save(entity);
    }

    @Override
    public void delete(int id) {
        categoryRepository.deleteById(id);
    }

    @Override
    public ModelAndView getAllCategories(int pageNumber, int pageSize) {
        ModelMap modelMap = new ModelMap();
        Pageable paging = PageRequest.of(pageNumber, pageSize, Sort.by("id").ascending());
        Page<Category> categories = categoryRepository.findAll(paging);
        List<Category> newCategories = categories.getContent();
        List<Integer> countPage = new ArrayList<>();
        for (int i = 1; i <= categories.getTotalPages(); i++) {
            countPage.add(i);
        }
        List<Image> images = imageRepository.getAllImagesCategories();
        modelMap.addAttribute("categories", newCategories);
        modelMap.addAttribute("imagesCategories", images);
        modelMap.addAttribute("countPage", countPage);
        modelMap.addAttribute("pageSize", pageSize);
        modelMap.addAttribute("pageNumber", pageNumber);
        return new ModelAndView(PagesPathEnum.HOME_PAGE.getPath(), modelMap);
    }

    @Override
    public void exportToFile(Writer writer) {
        try{
            List<Category> categories = read();
            StatefulBeanToCsv statefulBeanToCsv = new StatefulBeanToCsvBuilder(writer)
                    .withQuotechar(CSVWriter.NO_QUOTE_CHARACTER).build();
            statefulBeanToCsv.write(categories);
        } catch (CsvDataTypeMismatchException | CsvRequiredFieldEmptyException exception) {
            log.error(exception.getMessage());
        }
    }

    @Override
    public void importFromFile(MultipartFile file) {
        if(Optional.ofNullable(file).isPresent()) {
            try (Reader reader = new BufferedReader(new InputStreamReader(file.getInputStream()))) {
                CsvToBean<Category> csvToBean = new CsvToBeanBuilder(reader)
                        .withType(Category.class)
                        .withIgnoreLeadingWhiteSpace(true)
                        .withSeparator(',')
                        .build();
                List<Category> categories = csvToBean.parse();
                if (Optional.ofNullable(categories).isPresent() && categories.size() > 0) {
                    categories.stream().forEach(categoryRepository::save);
                }
            } catch (IOException exception) {
                log.error(exception.getMessage());
            }
        }
    }
}
