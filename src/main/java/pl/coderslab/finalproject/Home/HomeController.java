package pl.coderslab.finalproject.Home;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import pl.coderslab.finalproject.AppUser.*;

import javax.validation.Valid;
import java.util.Collections;
import java.util.HashSet;

@Controller
public class HomeController {
    private final RoleRepository roleRepository;
    private final BCryptPasswordEncoder passwordEncoder;
    private final AppUserRepository appUserRepository;

    public HomeController(RoleRepository roleRepository, BCryptPasswordEncoder passwordEncoder, AppUserRepository appUserRepository) {
        this.roleRepository = roleRepository;
        this.passwordEncoder = passwordEncoder;
        this.appUserRepository = appUserRepository;
    }

    @GetMapping("")
    public String homepage() {
        return "redirect:/recipe/all";
    }

    @GetMapping("/register")
    public String register(Model model) {
        model.addAttribute("appUser", new AppUser());
        return "home/register";
    }

    @PostMapping("/register")
    public String performRegistration(@Valid AppUser appUser, BindingResult result, Model model) {
        if (result.hasErrors()) {
            model.addAttribute("appUser", appUser);
            return "home/register";
        }
        appUser.setPassword(passwordEncoder.encode(appUser.getPassword()));
        appUser.setRoles(new HashSet<Role>(Collections.singletonList(roleRepository.findByName("ROLE_USER"))));
        appUserRepository.save(appUser);
        return "redirect:/";
    }

    @GetMapping("/login")
    public String login() {
        return "home/login";
    }
}
