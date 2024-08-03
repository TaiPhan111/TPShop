package com.phananhtai.shoppingOnline_service.entity;

import com.fasterxml.jackson.annotation.JsonBackReference;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;
import java.util.List;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "Categories")
public class Category  implements Serializable {
    @Id
    String id;
    String name;
    String description;
    Boolean active;
    @JsonBackReference
    @OneToMany(mappedBy = "category")
    List<Product> products;

}
