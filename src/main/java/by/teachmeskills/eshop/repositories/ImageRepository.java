package by.teachmeskills.eshop.repositories;

import by.teachmeskills.eshop.entities.Image;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ImageRepository extends JpaRepository<Image, Integer> {

    @Query("select i from Image i where i.product.id is null")
    List<Image> getAllImagesCategories();

    List<Image> getImagesByCategoryId(int categoryId);


    Image getImageByProductId(int productId);
}
