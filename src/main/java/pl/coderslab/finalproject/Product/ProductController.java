package pl.coderslab.finalproject.Product;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import pl.coderslab.finalproject.ShoppingList.ShoppingList;
import pl.coderslab.finalproject.ShoppingList.ShoppingListRepository;

import javax.validation.Valid;
import java.util.List;

@Controller
@RequestMapping("/user/list")
public class ProductController {

    private final ProductRepository productRepository;
    private final ShoppingListRepository shoppingListRepository;

    public ProductController(ProductRepository productRepository, ShoppingListRepository shoppingListRepository) {
        this.productRepository = productRepository;
        this.shoppingListRepository = shoppingListRepository;
    }

    @PostMapping("{id}/product/add")
    public String addProductToShoppingList(@PathVariable long id, @Valid Product product, BindingResult result, Model model) {
        if (result.hasErrors()) {
            model.addAttribute("shoppingList", shoppingListRepository.getOne(id));
            return "list/edit";
        }
        ShoppingList one = shoppingListRepository.getOne(id);
        List<Product> productsList = one.getProductsList();

        product.setId(productRepository.findTopByOrderByIdDesc().getId() + 1);
        productRepository.save(product);
        productsList.add(productRepository.findTopByOrderByIdDesc());
        one.setProductsList(productsList);
        shoppingListRepository.save(one);
        return "redirect:/user/list/edit/" + id;
    }
}
