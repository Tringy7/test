package com.test.laptopshop.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.test.laptopshop.domain.User;
import com.test.laptopshop.service.UserService;

import jakarta.validation.Valid;

@Controller
public class UserController {

    private UserService userService;

    public UserController(UserService userService) {
        this.userService = userService;
    }

    @RequestMapping("/admin/user")
    public String user(Model model) {
        model.addAttribute("usertable", this.userService.getUser());
        return "admin/user/show";
    }

    @GetMapping("/admin/user/create")
    public String userCreate(Model model) {
        model.addAttribute("user", new User());
        return "admin/user/create";
    }

    @PostMapping("/admin/user/create")
    public String userCreate(Model model,
            @Valid @ModelAttribute("user") User newUser,
            BindingResult userBindingResult,
            @RequestParam("fileImage") MultipartFile file) {

        if (userBindingResult.hasErrors()) {
            return "admin/user/create";
        }
        if (file != null) {
            String avatar = this.userService.hadleUploadImageFile(file, "avatar");
            newUser.setAvatar(avatar);
        }
        this.userService.userCreate(newUser);
        return "redirect:/admin/user";
    }

    @RequestMapping("/admin/user/{id}")
    public String user(Model model, @PathVariable("id") Long id) {
        model.addAttribute("userDetail", this.userService.getUserDetail(id));
        return "admin/user/showDetail";
    }

    // Update
    @RequestMapping("/admin/user/update/{id}")
    public String update(Model model, @PathVariable("id") Long id) {
        model.addAttribute("user", this.userService.getUserId(id));
        return "/admin/user/update";
    }

    @PostMapping("/admin/user/update/{id}")
    public String userUpdate(Model model,
            @Valid @ModelAttribute("user") User newUser,
            BindingResult userBindingResult,
            @RequestParam("fileImage") MultipartFile file) {
                
        if (userBindingResult.hasErrors()) {
            return "admin/user/update";
        }
        if (file != null && file.getOriginalFilename() != null && !"".equals(file.getOriginalFilename())) {
            String avatar = this.userService.hadleUploadImageFile(file, "avatar");
            newUser.setAvatar(avatar);
        }
        this.userService.userUpdate(newUser);
        return "redirect:/admin/user";
    }

    // Delete
    @GetMapping("/admin/user/delete/{id}")
    public String delete(@PathVariable("id") Long id, Model model) {
        model.addAttribute("user", this.userService.getUserId(id));
        return "/admin/user/delete";
    }

    @PostMapping("/admin/user/delete/{id}")
    public String deleteUser(Model model, @PathVariable("id") Long id) {
        this.userService.deleteUser(id);
        return "redirect:/admin/user";
    }

}
