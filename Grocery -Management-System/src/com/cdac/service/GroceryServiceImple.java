package com.cdac.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cdac.dao.GroceryDao;
import com.cdac.dto.Grocery;

@Service
public class GroceryServiceImple implements GroceryService{

	@Autowired
	private GroceryDao groceryDao;

	
	@Override
	public void addGrocery(Grocery grocery) {
		groceryDao.insertGrocery(grocery);
	}

	@Override
	public void removeGrocery(int groceryId) {
		groceryDao.deleteGrocery(groceryId);
		
	}

	@Override
	public Grocery findGrocery(int groceryId) {
		return groceryDao.selectGrocery(groceryId);
	}

	@Override
	public void modifyGrocery(Grocery grocery) {
		groceryDao.updateGrocery(grocery);
	}

	@Override
	public List<Grocery> selectAll(int userId) {
		return groceryDao.selectAll(userId);
	}

}
