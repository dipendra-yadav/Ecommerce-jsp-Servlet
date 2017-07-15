package com.controller;

import java.util.List;

//javax.annotation-api-1.3.jar
import javax.annotation.ManagedBean;

//@ManagedBean
public class ProductDetails {
	private List<String> product_Id;

	private List<String> product_name; // storing name in a list array.
	private List<String> product_description;
	private List<String> product_price;
	private List<String> product_brand;

	// getter +setter

	public void setProduct_name(List<String> product_name) {
		this.product_name = product_name;
	}

	public List<String> getProduct_Id() {
		return product_Id;
	}

	public void setProduct_Id(List<String> product_Id) {
		this.product_Id = product_Id;
	}

	public List<String> getProduct_name() {
		return product_name;
	}

	public List<String> getProduct_description() {
		return product_description;
	}

	public void setProduct_description(List<String> product_description) {
		this.product_description = product_description;
	}

	public List<String> getProduct_price() {
		return product_price;
	}

	public void setProduct_price(List<String> product_price) {
		this.product_price = product_price;
	}

	public List<String> getProduct_brand() {
		return product_brand;
	}

	public void setProduct_brand(List<String> product_brand) {
		this.product_brand = product_brand;
	}

	@Override
	public String toString() {
		return "" + this.product_name;
	}
}
