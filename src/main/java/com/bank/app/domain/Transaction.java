package com.bank.app.domain;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import javax.persistence.*;
import java.io.Serializable;

import java.util.Date;

@Entity
@Table(name = "transaction")
@JsonIgnoreProperties({"hibernateLazyInitializer", "handler"})
public class Transaction implements Serializable {

    @Id
    private int transactionId;

    private double transactionAmount;
    private String transactionDescription;
    private String merchantId;
    private Date transactionDate;
    private int toAccount;
    private String transactionType;
    private String transactionMode;
    private String transactionStatus;

    @ManyToOne
    @JoinColumn(name = "account_id")
    @JsonBackReference//(value="transaction-account")
    private Account account;

    public Transaction() {
    }

    public Transaction(int transactionId, double transactionAmount, String transactionDescription, String merchantId, Date transactionDate, int toAccount, String transactionType, String transactionMode, String transactionStatus, Account account) {
        this.transactionId = transactionId;
        this.transactionAmount = transactionAmount;
        this.transactionDescription = transactionDescription;
        this.merchantId = merchantId;
        this.transactionDate = transactionDate;
        this.toAccount = toAccount;
        this.transactionType = transactionType;
        this.transactionMode = transactionMode;
        this.transactionStatus = transactionStatus;
        this.account = account;
    }

    public int getTransactionId() {
        return transactionId;
    }

    public void setTransactionId(int transactionId) {
        this.transactionId = transactionId;
    }

    public double getTransactionAmount() {
        return transactionAmount;
    }

    public void setTransactionAmount(double transactionAmount) {
        this.transactionAmount = transactionAmount;
    }

    public String getTransactionDescription() {
        return transactionDescription;
    }

    public void setTransactionDescription(String transactionDescription) {
        this.transactionDescription = transactionDescription;
    }

    public String getmerchantId() {
        return merchantId;
    }

    public void setMerchantId(String merchantId) {
        this.merchantId = merchantId;
    }

    public Date getTransactionDate() {
        return transactionDate;
    }

    public void setTransactionDate(Date transactionDate) {
        this.transactionDate = transactionDate;
    }

    public int getToAccount() {
        return toAccount;
    }

    public void setToAccount(int toAccount) {
        this.toAccount = toAccount;
    }

    public String getTransactionType() {
        return transactionType;
    }

    public void setTransactionType(String transactionType) {
        this.transactionType = transactionType;
    }

    public Account getAccount() {
        return account;
    }

    public void setAccount(Account account) {
        this.account = account;
    }

    public String getTransactionMode() {
        return transactionMode;
    }

    public void setTransactionMode(String transactionMode) {
        this.transactionMode = transactionMode;
    }

    public String getTransactionStatus() {
        return transactionStatus;
    }

    public void setTransactionStatus(String transactionStatus) {
        this.transactionStatus = transactionStatus;
    }

    @Override
    public String toString() {
        return "Transaction{" +
                "transactionId=" + transactionId +
                ", transactionAmount=" + transactionAmount +
                ", transactionDescription='" + transactionDescription + '\'' +
                ", merchantId='" + merchantId + '\'' +
                ", transactionDate=" + transactionDate +
                ", toAccount=" + toAccount +
                ", transactionType='" + transactionType + '\'' +
                ", transactionMode='" + transactionMode + '\'' +
                ", transactionStatus='" + transactionStatus + '\'' +
                ", account=" + account +
                '}';
    }

}
