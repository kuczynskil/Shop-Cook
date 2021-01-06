package pl.coderslab.finalproject.ShoppingList;

import lombok.Getter;
import lombok.Setter;
import pl.coderslab.finalproject.AppUser.AppUser;
import pl.coderslab.finalproject.Product.Product;

import javax.persistence.*;
import javax.validation.constraints.Size;
import java.time.LocalDateTime;
import java.util.List;

@Entity
@Getter
@Setter
public class ShoppingList {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;

    @Size(min = 1)
    private String name;
    private LocalDateTime createdOn;

    @ManyToMany
    @JoinTable(name = "shopping_list_products", inverseJoinColumns = @JoinColumn(name = "product_id"))
    private List<Product> productsList;

    @ManyToOne
    private AppUser appUser;

    @PrePersist
    public void prePersist() {
        this.createdOn = LocalDateTime.now();
    }


}
