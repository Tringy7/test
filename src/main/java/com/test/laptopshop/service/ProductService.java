package com.test.laptopshop.service;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;

import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.test.laptopshop.domain.Product;
import com.test.laptopshop.repository.ProductRepository;

import jakarta.servlet.ServletContext;

@Service
public class ProductService {

    private final ProductRepository productRepository;
    private final ServletContext servletContext;
    @Autowired
    private ModelMapper modelMapper;

    public ProductService(ProductRepository productRepository, ServletContext servletContext) {
        this.productRepository = productRepository;
        this.servletContext = servletContext;
    }

    public Product getProductDetail(Long id) {
        return this.productRepository.findById(id).get();
    }

    public List<Product> getProduct() {
        return this.productRepository.findAll();
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

    public Product productCreate(Product newProduct) {
        return this.productRepository.save(newProduct);
    }

    public Product productUpdate(Product newProduct) {
        Product temp = this.productRepository.findById(newProduct.getId()).get();
        if (temp != null) {
            temp = modelMapper.map(newProduct, temp.getClass());
        }
        return this.productRepository.save(temp);
    }

    public void deleteProduct(Long id) {
        this.productRepository.deleteById(id);
    }
}
