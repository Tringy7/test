package com.test.laptopshop.controller.admin;

import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.test.laptopshop.domain.Product;
import com.test.laptopshop.service.ProductService;

import jakarta.validation.Valid;

@Controller
public class ProductController {

    private final ProductService productService;

    public ProductController(ProductService productService) {
        this.productService = productService;
    }

    // Show product
    @GetMapping("/admin/product")
    public String getProduct(Model model, @RequestParam(value = "page") Optional<String> pageNumber) {
        int page = 0;
        try {
            if (pageNumber.isPresent()) {
                page = Integer.parseInt(pageNumber.get());
            }
        } catch (Exception e) {
        }
        Pageable pageable = PageRequest.of(page, 1);
        Page<Product> ps = this.productService.getPageAdmin(pageable);
        List<Product> prodList = ps.getContent();
        model.addAttribute("Product", prodList);
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", ps.getTotalPages() - 1);
        return "admin/product/show";
    }

    // Create product 
    @GetMapping("/admin/product/create")
    public String showProduct(Model model) {
        model.addAttribute("newProduct", new Product());
        return "admin/product/create";
    }

    @PostMapping("/admin/product/create")
    public String createProduct(
            @Valid @ModelAttribute("newProduct") Product newProduct,
            BindingResult productBindingResult,
            @RequestParam("fileImage") MultipartFile file,
            Model model) {
        if (productBindingResult.hasErrors()) {
            return "admin/product/create";
        }
        if (file != null && !file.getOriginalFilename().equals("")) {
            String img = this.productService.hadleUploadImageFile(file, "product");
            newProduct.setImage(img);
        }
        this.productService.productCreate(newProduct);
        return "redirect:/admin/product";
    }

    // Show detail product
    @GetMapping("/admin/product/{id}")
    public String showDetailProduct(Model model, @PathVariable long id) {
        model.addAttribute("detailProduct", this.productService.getProductDetail(id));
        return "admin/product/detail";
    }

    // Update product 
    @GetMapping("/admin/product/update/{id}")
    public String showUpdateProduct(Model model, @PathVariable long id) {
        model.addAttribute("product", this.productService.getProductDetail(id));
        return "admin/product/update";
    }

    @PostMapping("/admin/product/update/{id}")
    public String postMethodName(
            @Valid @ModelAttribute("product") Product product,
            BindingResult productBindingResult,
            @RequestParam("fileImage") MultipartFile file,
            Model model) {
        if (productBindingResult.hasErrors()) {
            return "admin/user/update";
        }
        if (file != null && file.getOriginalFilename() != null && !"".equals(file.getOriginalFilename())) {
            String image = this.productService.hadleUploadImageFile(file, "product");
            product.setImage(image);
        }
        this.productService.productUpdate(product);
        return "redirect:/admin/product";
    }

    // Delete Product 
    @GetMapping("/admin/product/delete/{id}")
    public String deleteShowProduct(Model model, @PathVariable("id") Long id) {
        model.addAttribute("product", this.productService.getProductDetail(id));
        return "admin/product/delete";
    }

    @PostMapping("/admin/product/delete/{id}")
    public String deleteProduct(@PathVariable("id") Long id) {
        this.productService.deleteProduct(id);
        return "redirect:/admin/product";
    }

}
