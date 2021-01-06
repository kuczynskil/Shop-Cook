package pl.coderslab.finalproject.Recipe;

import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import pl.coderslab.finalproject.AppUser.CurrentUser;
import pl.coderslab.finalproject.ShoppingList.ShoppingList;
import pl.coderslab.finalproject.ShoppingList.ShoppingListRepository;

import java.util.ArrayList;

@Controller
@RequestMapping("/recipe")
public class RecipeController {

    private final RecipeRepository recipeRepository;
    private final ShoppingListRepository shoppingListRepository;

    public RecipeController(RecipeRepository recipeRepository, ShoppingListRepository shoppingListRepository) {
        this.recipeRepository = recipeRepository;
        this.shoppingListRepository = shoppingListRepository;
    }

    @GetMapping("/all")
    public String showAllRecipes(Model model) {
        model.addAttribute("recipes", recipeRepository.findAll());
        return "recipe/all";
    }

    @GetMapping("/{id}")
    public String showRecipeDetails(Model model, @PathVariable long id) {
        Recipe recipe = recipeRepository.findById(id).get();
        model.addAttribute("recipe", recipe);
        model.addAttribute("ingredients", recipe.getIngredientsList());
        return "recipe/details";
    }

    @PostMapping("/{id}")
    public String addIngredientsToShoppingList(@PathVariable long id) {
        ShoppingList shoppingList = new ShoppingList();
        Recipe recipe = recipeRepository.findById(id).get();

        shoppingList.setName(recipe.getName());
        shoppingList.setAppUser(((CurrentUser) SecurityContextHolder.getContext()
                .getAuthentication().getPrincipal()).getUser());
        shoppingList.setProductsList(new ArrayList<>(recipe.getIngredientsList()));
        shoppingListRepository.save(shoppingList);
        return "redirect:/recipe/all";
    }
}
