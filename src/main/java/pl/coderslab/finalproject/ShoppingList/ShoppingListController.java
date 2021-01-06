package pl.coderslab.finalproject.ShoppingList;

import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import pl.coderslab.finalproject.AppUser.CurrentUser;
import pl.coderslab.finalproject.Product.Product;
import pl.coderslab.finalproject.Product.ProductRepository;

import javax.validation.Valid;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/user/list")
public class ShoppingListController {

    private final ShoppingListRepository shoppingListRepository;
    private final ProductRepository productRepository;

    public ShoppingListController(ShoppingListRepository shoppingListRepository, ProductRepository productRepository) {
        this.shoppingListRepository = shoppingListRepository;
        this.productRepository = productRepository;
    }

    @GetMapping("/{id}")
    public String listDetails(@PathVariable long id, Model model) {
        if (shoppingListRepository.findById(id).isPresent()) {
            ShoppingList shoppingList = shoppingListRepository.findById(id).get();
            model.addAttribute("shoppingList", shoppingList);
        }
        return "list/details";
    }

    @GetMapping("/edit/{id}")
    public String listEdit(@PathVariable long id, Model model) {
        if (shoppingListRepository.findById(id).isPresent()) {
            ShoppingList shoppingList = shoppingListRepository.findById(id).get();
            model.addAttribute("shoppingList", shoppingList);
        }
        model.addAttribute("product", new Product());
        return "list/edit";
    }

    @GetMapping("/delete/{id}")
    public String listDelete(@PathVariable long id) {
        shoppingListRepository.delete(shoppingListRepository.findById(id).get());
        return "redirect:/user/home";
    }

    @GetMapping("/{shoppingListId}/product/delete/{productId}")
    public String deleteProductFromList(@PathVariable long shoppingListId, @PathVariable long productId) {
        ShoppingList shoppingList = shoppingListRepository.findById(shoppingListId).get();
        List<Product> productsList = shoppingList.getProductsList();
        productsList.remove(productRepository.findById(productId).get());
        shoppingList.setProductsList(productsList);
        shoppingListRepository.save(shoppingList);
        return "redirect:/user/list/edit/" + shoppingListId;
    }

    @GetMapping("{shoppingListId}/product/deleteAll")
    public String deleteAllProductsFromList(@PathVariable long shoppingListId) {
        ShoppingList shoppingList = shoppingListRepository.findById(shoppingListId).get();
        shoppingList.setProductsList(new ArrayList<>());
        shoppingListRepository.save(shoppingList);
        return "redirect:/user/list/edit/" + shoppingListId;
    }
}
