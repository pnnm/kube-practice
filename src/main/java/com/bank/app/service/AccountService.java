package com.bank.app.service;

import com.bank.app.domain.Account;

import java.util.List;


public interface AccountService {

    public abstract String createAccount(Account account);

    public abstract String getAccountById(int id);

    public abstract Account getAccountInfo(int id);

    //public Account getAccountById(int accountId);

    public abstract boolean updateAccount(Account account);

    public abstract void deleteAccount(int accountId);

    public abstract List<Account> getAllAccounts();
}
