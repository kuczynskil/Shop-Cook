package pl.coderslab.finalproject.ShoppingList;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import pl.coderslab.finalproject.AppUser.AppUser;

import java.util.List;

@Repository
public interface ShoppingListRepository extends JpaRepository<ShoppingList, Long> {

    List<ShoppingList> findByAppUser(AppUser appUser);
    List<ShoppingList> findByAppUserOrderByCreatedOnDesc(AppUser appUser);
    ShoppingList findTopByAppUserOrderByCreatedOnDesc(AppUser appUser);
}
