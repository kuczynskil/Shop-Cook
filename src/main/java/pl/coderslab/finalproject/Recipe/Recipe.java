package pl.coderslab.finalproject.Recipe;

import lombok.Getter;
import lombok.Setter;
import pl.coderslab.finalproject.Product.Product;

import javax.persistence.*;
import java.util.List;

@Entity
@Getter
@Setter
public class Recipe {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;

    private String name;

    @Column(length = 2000)
    private String preparation;

    private String imageURL;

    @ManyToMany
    @JoinTable(name = "recipe_products", inverseJoinColumns = @JoinColumn(name = "product_id"))
    private List<Product> ingredientsList;


}
