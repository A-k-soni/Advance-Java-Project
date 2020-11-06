package com.cdac.service;


import java.util.List;

import com.cdac.dto.Grocery;

public interface GroceryService {
	void addGrocery(Grocery grocery);
	void removeGrocery(int groceryId);
	Grocery findGrocery(int groceryId);
	void modifyGrocery(Grocery grocery);
	List<Grocery> selectAll(int userId);
}
