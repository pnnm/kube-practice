package com.bank.app.domain;

import java.util.HashSet;
import java.util.Set;
import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonManagedReference;

@Entity
@Table(name = "customer")
@JsonIgnoreProperties({"hibernateLazyInitializer", "handler"})
public class Customer {

    @Id
    private int customerId;

    private String firstName;
    private String lastName;
    private String email;
    private int contactNumber;
    private String aadharNumber;
    private int branchCode;

	/*@ManyToMany(cascade = { CascadeType.ALL })
	@JoinTable(name = "customer_account", joinColumns = { @JoinColumn(name = "id") }, 
	inverseJoinColumns = {@JoinColumn(name = "account_id") })
	Set<Account> accounts = new HashSet<>();*/

    @OneToMany(mappedBy = "customer", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    @JsonManagedReference
    private Set<Account> accountSet = new HashSet<Account>();

    public Customer() {
        super();
    }

    public Customer(int customerId, String firstName, String lastName, String email, int contactNumber,
                    String aadharNumber, int branchCode, Set<Account> accountSet) {
        super();
        this.customerId = customerId;
        this.firstName = firstName;
        this.lastName = lastName;
        this.email = email;
        this.contactNumber = contactNumber;
        this.aadharNumber = aadharNumber;
        this.branchCode = branchCode;
        this.accountSet = accountSet;
    }

    public int getCustomerId() {
        return customerId;
    }

    public void setCustomerId(int customerId) {
        this.customerId = customerId;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public int getContactNumber() {
        return contactNumber;
    }

    public void setContactNumber(int contactNumber) {
        this.contactNumber = contactNumber;
    }

    public String getAadharNumber() {
        return aadharNumber;
    }

    public void setAadharNumber(String aadharNumber) {
        this.aadharNumber = aadharNumber;
    }

    public int getBranchCode() {
        return branchCode;
    }

    public void setBranchCode(int branchCode) {
        this.branchCode = branchCode;
    }

    public Set<Account> getAccountSet() {
        return accountSet;
    }

    public void setAccountSet(Set<Account> accountSet) {
        this.accountSet = accountSet;
    }

    @Override
    public String toString() {
        return "Customer [customerId=" + customerId + ", firstName=" + firstName + ", lastName=" + lastName + ", email="
                + email + ", contactNumber=" + contactNumber + ", aadharNumber=" + aadharNumber + ", branchCode="
                + branchCode + ", accountSet=" + accountSet + "]";
    }


}
