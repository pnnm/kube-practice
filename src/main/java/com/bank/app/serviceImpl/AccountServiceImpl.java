package com.bank.app.serviceImpl;

import java.util.List;

import javax.transaction.Transactional;

import com.bank.app.domain.Account;
import com.bank.app.repository.AccountRepository;
import com.bank.app.service.AccountService;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AccountServiceImpl implements AccountService {

    @Autowired
    private AccountRepository accountRepo;

    @Transactional
    public String createAccount(Account account) {
        String status = "";
        // TODO Auto-generated method stub
        String s = String.valueOf(accountRepo.findExistingAccountType(account.getCustomer().getCustomerId()));
        if (!s.contains(account.getType())) {
            accountRepo.save(account);
            status = "Success";
        } else {
            status = "Account type for the cusstomer already exists in the same branch..";
        }
        System.out.println(s);
        return status;
    }

    @Transactional
    public String getAccountById(int accountId) {
        String str = accountRepo.getOne(accountId).toString();
        JsonParser jsonParser = new JsonParser();
        JsonObject objectFromString = jsonParser.parse(str).getAsJsonObject();
        System.out.println("AccountDetails---->" + objectFromString);
        return String.valueOf(objectFromString);
    }

    @Transactional
    public Account getAccountInfo(int accountId) {
        return accountRepo.getOne(accountId);
    }

    @Transactional
    public boolean updateAccount(Account account) {
        // TODO Auto-generated method stub
        return accountRepo.save(account) != null;
    }

    @Transactional
    public void deleteAccount(int accountId) {
        // TODO Auto-generated method stub
        accountRepo.deleteById(accountId);
        ;
    }

    @Transactional
    public List<Account> getAllAccounts() {
        // TODO Auto-generated method stub
        return accountRepo.findAll();
    }


}
