package com.phananhtai.shoppingOnline_service.dto;


import jakarta.mail.Multipart;
import jakarta.validation.constraints.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.web.multipart.MultipartFile;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ProductDTO {
    int id ;

    @NotBlank(message = "Name is mandatory")
    @Size(max = 100, message = "Name must be less than 100 characters")
    String name;


    String image;


    String description;

    @NotNull(message = "Price is mandatory")
    @Min(value = 0, message = "Price must be greater than or equal to 0")
    Double price;

    @NotNull(message = "Active status is mandatory")
    Boolean active;


    @NotNull(message = "Category ID is mandatory")
    @Min(value = 1, message = "Category ID must be greater than or equal to 1")
    private int idCategory;

    MultipartFile photo;


}
