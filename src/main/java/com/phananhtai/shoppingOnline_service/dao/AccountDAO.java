package com.phananhtai.shoppingOnline_service.dao;


import com.phananhtai.shoppingOnline_service.entity.Account;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface AccountDAO extends JpaRepository<Account, String> {
  Account findByUsername(String UserName);
  Account findByUsernameAndActivated(String UserName,boolean active);
  List<Account> findAll();

}
