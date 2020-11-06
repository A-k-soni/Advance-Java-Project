package com.cdac.dao;

import com.cdac.dto.Grocery;
import java.util.List;

public interface GroceryDao {
	void insertGrocery(Grocery grocery);
	void deleteGrocery(int groceryId);
	Grocery selectGrocery(int groceryId);
	void updateGrocery(Grocery grocery);
	List<Grocery> selectAll(int userId);
}
