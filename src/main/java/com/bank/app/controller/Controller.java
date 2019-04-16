package com.bank.app.controller;

import java.util.List;

import com.bank.app.domain.Account;
import com.bank.app.serviceImpl.AccountServiceImpl;/*
import com.bank.app.serviceImpl.Consumer;
import com.bank.app.serviceImpl.Producer;*/
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/Account")
public class Controller {

    private static final String Topic = "test";

    @Autowired
    private AccountServiceImpl accountServiceImpl;

	/*@Autowired
	Producer producer;

	@Autowired
	Consumer consumer;*/

    @RequestMapping(value = "/getAccountById/{id}", method = RequestMethod.GET, headers = "Accept=application/json")
    @ResponseBody
    public String getaccountById(@PathVariable Integer id) {
        return accountServiceImpl.getAccountById(id);
    }

    @RequestMapping(value = "/getAccountInfo/{id}", method = RequestMethod.GET)
    @ResponseBody
    public Account getAccountInfo(@PathVariable Integer id) {
        Account account = accountServiceImpl.getAccountInfo(id);
        return account;
    }


    @RequestMapping(value = "/getAllAccounts", method = RequestMethod.GET)
    public List<Account> getAllAccounts() {
        return accountServiceImpl.getAllAccounts();
    }

    @RequestMapping(value = "/insertAccount", method = RequestMethod.POST)
    public String insertAccount(@RequestBody Account account) {
        String str = accountServiceImpl.createAccount(account);
		/*if(str != null) {
			 producer.sendAccount(account);
		}*/
        return str;
    }

    @RequestMapping(value = "/updateAccount", method = RequestMethod.PUT)
    public HttpStatus updateCustomer(@RequestBody Account account) {
        return accountServiceImpl.updateAccount(account) ? HttpStatus.LOCKED : HttpStatus.BAD_REQUEST;
    }

    @RequestMapping(value = "/deleteAccountById/{id}", method = RequestMethod.DELETE)
    public HttpStatus deleteAccount(@PathVariable Integer id) {
        accountServiceImpl.deleteAccount(id);
        return HttpStatus.NO_CONTENT;
    }

}
