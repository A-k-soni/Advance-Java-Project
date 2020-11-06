package com.cdac.dto;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "grocery")
public class Grocery {
	@Id
	@Column(name = "grocery_id")
	@GeneratedValue
	private int groceryId;
	@Column(name = "item_name")
	private String itemName;
	private int quantity;
	private float price;
	@Column(name = "purchase_date")
	private String purchaseDate;
	@Column(name = "expiry_date")
	private String expiryDate;
	private int userId;
	public String getPurchaseDate() {
		return purchaseDate;
	}
	public void setPurchaseDate(String purchaseDate) {
		this.purchaseDate = purchaseDate;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public Grocery() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Grocery(int groceryId) {
		super();
		this.groceryId = groceryId;
	}
	public int getGroceryId() {
		return groceryId;
	}
	public void setGroceryId(int groceryId) {
		this.groceryId = groceryId;
	}
	public String getItemName() {
		return itemName;
	}
	public void setItemName(String itemName) {
		this.itemName = itemName;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public float getPrice() {
		return price;
	}
	public void setPrice(float price) {
		this.price = price;
	}
	public String getExpiryDate() {
		return expiryDate;
	}
	public void setExpiryDate(String expiryDate) {
		this.expiryDate = expiryDate;
	}
	
	
	
}
