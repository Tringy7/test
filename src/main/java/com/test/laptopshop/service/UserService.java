package com.test.laptopshop.service;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;

import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.test.laptopshop.domain.User;
import com.test.laptopshop.domain.dto.UserDTO;
import com.test.laptopshop.repository.RoleRepository;
import com.test.laptopshop.repository.UserRepository;

import jakarta.servlet.ServletContext;

@Service
public class UserService {

    private UserRepository userRepository;
    private ServletContext servletContext;
    private RoleRepository roleRepository;
    private PasswordEncoder passwordEncoder;

    public UserService(UserRepository userRepository, ServletContext servletContext, RoleRepository roleRepository, PasswordEncoder passwordEncoder) {
        this.userRepository = userRepository;
        this.servletContext = servletContext;
        this.roleRepository = roleRepository;
        this.passwordEncoder = passwordEncoder;
    }

    public List<User> getUser() {
        return this.userRepository.findAll();
    }

    public void userCreate(User user) {
        user.setRole(this.roleRepository.findById(user.getRole().getId()).get());
        user.setPassword(this.passwordEncoder.encode(user.getPassword()));
        this.userRepository.save(user);
    }

    public User getUserDetail(Long id) {
        return this.userRepository.findById(id).get();
    }

    public void userUpdate(User user) {
        User tempUser = this.userRepository.findById(user.getId()).get();
        if (tempUser != null) {
            tempUser.setEmail(user.getEmail());
            tempUser.setFullName(user.getFullName());
            tempUser.setAddress(user.getAddress());
            tempUser.setPhone(user.getPhone());
            tempUser.setAvatar(user.getAvatar());
        }
        this.userRepository.save(tempUser);
    }

    public User getUserId(Long id) {
        return this.userRepository.findById(id).get();
    }

    public void deleteUser(Long id) {
        if (this.userRepository.findById(id).get() != null) {
            this.userRepository.deleteById(id);
        }
    }

    public String hadleUploadImageFile(MultipartFile file, String folder) {
        String finalName = "";
        try {
            byte[] bytes = file.getBytes();
            String rootPath = this.servletContext.getRealPath("/resources/images");
            File dir = new File(rootPath + File.separator + folder);
            if (!dir.exists()) {
                dir.mkdirs();
            }
            // Create the file on server
            finalName = System.currentTimeMillis() + "-" + file.getOriginalFilename();
            File serverFile = new File(dir.getAbsolutePath() + File.separator + finalName);
            BufferedOutputStream stream = new BufferedOutputStream(
                    new FileOutputStream(serverFile));
            stream.write(bytes);
            stream.close();
        } catch (IOException e) {
            return "You failed to upload " + finalName + " => " + e.getMessage();
        }
        return finalName;
    }

    // Check Email exist
    public boolean checkEmail(UserDTO user) {
        return this.userRepository.existsByEmail(user.getEmail());
    }

    // Save account register new user
    public void saveRegister(UserDTO userDTO) {
        User user = User.builder()
                .email(userDTO.getEmail())
                .fullName(userDTO.getFirstName() + " " + userDTO.getLastName())
                .password(this.passwordEncoder.encode(userDTO.getPassword()))
                .role(this.roleRepository.findByName("USER"))
                .build();
        this.userRepository.save(user);
    }

    public User getUserByEmail(String email) {
        return this.userRepository.findByEmail(email);
    }
}
