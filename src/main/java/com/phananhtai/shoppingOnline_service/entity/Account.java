package com.phananhtai.shoppingOnline_service.entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;
import java.util.List;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "Accounts")
public class Account implements Serializable {
    @Id
    String username;
    String password;
    String address;
    Integer phone;
    String fullname;
    String email;
    String photo;
    boolean activated;
    boolean admin;
    @OneToMany(mappedBy = "account")
    List<Order> orders;

    @Transient
    String ConfirmPassword;
}
