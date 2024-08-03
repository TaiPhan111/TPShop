package com.phananhtai.shoppingOnline_service.dto;

import jakarta.mail.Multipart;
import jakarta.validation.constraints.AssertTrue;
import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.web.multipart.MultipartFile;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class UserDTO {
    int id;

    @NotBlank(message = "{NotBlank.userDTO.username}")
    private String username;

    @NotBlank(message = "{NotBlank.userDTO.password}")
    @Size(min = 8, message = "{Size.userDTO.password}")
    private String password;

    private String fullname;

    @NotBlank(message = "{NotBlank.userDTO.email}")
    @Email(message = "{Email.userDTO.email}")
    private String email;

    private String photo;

    private boolean activated;

    private boolean admin;

    @NotBlank(message = "{NotBlank.userDTO.confirmPassword}")
    private String confirmPassword;

    @AssertTrue(message = "{AssertTrue.userDTO.passwordConfirmed}")
    public boolean isPasswordConfirmed() {
        return password != null && password.equals(confirmPassword);
    }

    private MultipartFile file;
}
