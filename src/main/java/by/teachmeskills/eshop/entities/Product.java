package by.teachmeskills.eshop.entities;

import com.opencsv.bean.CsvBindByName;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.experimental.SuperBuilder;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import java.util.List;

@NoArgsConstructor
@Getter
@Setter
@Entity
@Table(name = "products")
@SuperBuilder
public class Product extends BaseEntity {

    @ManyToOne(optional = false)
    @JoinColumn(name = "category_id", nullable = false)
    private Category category;

    @CsvBindByName
    @Column(name = "name")
    private String name;

    @CsvBindByName
    @Column(name = "description")
    private String description;

    @CsvBindByName
    @Column(name = "price")
    private int price;

    @ManyToMany(mappedBy = "products", cascade = CascadeType.ALL)
    private List<Order> orders;

    @OneToMany(mappedBy = "product", orphanRemoval = true, cascade = CascadeType.ALL)
    private List<Image> images;
}
