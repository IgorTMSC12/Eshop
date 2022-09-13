package by.teachmeskills.eshop.controller;

import by.teachmeskills.eshop.entities.Cart;
import by.teachmeskills.eshop.services.impl.CartServiceImpl;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

@RestController
@SessionAttributes({"cart"})
@RequestMapping("/cart")
public class CartController {
    private CartServiceImpl cartService;

    public CartController(CartServiceImpl cartService){
        this.cartService = cartService;
    }

    @GetMapping
    public ModelAndView openCartPage(@ModelAttribute("cart") Cart cart) {
        return cartService.getCartPage(cart);
    }

    @PostMapping("/add")
    public ModelAndView addProductToCart(@RequestParam("productId") int productId, @ModelAttribute("cart") Cart cart) {
        return cartService.addProductToCart(productId, cart);
    }

    @PostMapping("/delete")
    public ModelAndView deleteProductToCart(@RequestParam("productId") int productId, @ModelAttribute("cart") Cart cart) {
        return cartService.deleteProductToCart(productId, cart);
    }

    @PostMapping("/create")
    private ModelAndView createOrder(@ModelAttribute("cart") Cart cart) {
        return cartService.createOrder(cart);
    }

    @ModelAttribute("cart")
    public Cart shoppingCart() {
        return new Cart();
    }
}
