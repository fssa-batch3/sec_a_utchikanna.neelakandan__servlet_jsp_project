/**
 * 
 */
package com.fssa.cinephile.model;

import java.time.LocalDate;

/**
 * 
 */
public class Account {
	private String accNo;
	private String accHolderName;
	private double balance;
	private LocalDate openingDate;
	public String getAccNo() {
		return accNo;
	}
	public void setAccNo(String accNo) {
		this.accNo = accNo;
	}
	public String getAccHolderName() {
		return accHolderName;
	}
	public void setAccHolderName(String accHolderName) {
		this.accHolderName = accHolderName;
	}
	public double getBalance() {
		return balance;
	}
	public void setBalance(double balance) {
		this.balance = balance;
	}
	public LocalDate getOpeningDate() {
		return openingDate;
	}
	public void setOpeningDate(LocalDate openingDate) {
		this.openingDate = openingDate;
	}
	public Account(String accNo, String accHolderName, double balance, LocalDate openingDate) {
		super();
		this.accNo = accNo;
		this.accHolderName = accHolderName;
		this.balance = balance;
		this.openingDate = openingDate;
	}
	
	
	
}