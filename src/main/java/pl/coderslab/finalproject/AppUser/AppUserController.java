package pl.coderslab.finalproject.AppUser;

import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import pl.coderslab.finalproject.ShoppingList.ShoppingList;
import pl.coderslab.finalproject.ShoppingList.ShoppingListRepository;

import javax.validation.Valid;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;

@Controller
@RequestMapping("/user")
public class AppUserController {

    private final ShoppingListRepository shoppingListRepository;

    public AppUserController(ShoppingListRepository shoppingListRepository) {
        this.shoppingListRepository = shoppingListRepository;
    }

    @GetMapping("/home")
    public String userHomePage(Model model) {
        model.addAttribute("shoppingLists", shoppingListRepository
                .findByAppUserOrderByCreatedOnDesc(((CurrentUser) SecurityContextHolder.getContext()
                        .getAuthentication().getPrincipal()).getUser()));
        model.addAttribute(
                "localDateTimeFormat", DateTimeFormatter.ofPattern("HH:mm yyyy/MM/dd"));
        return "user/home";
    }

    @GetMapping("/addlist")
    public String userAddList(Model model) {
        model.addAttribute("shoppingList", new ShoppingList());
        return "user/addlist";
    }

    @PostMapping("/addlist")
    public String userAddListPerform(@Valid ShoppingList shoppingList, BindingResult result, Model model) {
        if (result.hasErrors()) {
            model.addAttribute("shoppingList", shoppingList);
            return "user/addlist";
        }
        shoppingList.setAppUser(((CurrentUser) SecurityContextHolder.getContext()
                .getAuthentication().getPrincipal()).getUser());
        if (shoppingListRepository
                .findByAppUser(((CurrentUser) SecurityContextHolder.getContext()
                        .getAuthentication().getPrincipal()).getUser()).size() > 0) {
            shoppingList.setProductsList(new ArrayList<>(shoppingListRepository
                    .findTopByAppUserOrderByCreatedOnDesc(shoppingList.getAppUser()).getProductsList()));
        }
        shoppingListRepository.save(shoppingList);
        return "redirect:/user/home";
    }
}
