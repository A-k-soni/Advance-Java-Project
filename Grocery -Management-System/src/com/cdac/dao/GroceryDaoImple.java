package com.cdac.dao;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.Servlet;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Query;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate4.HibernateCallback;
import org.springframework.orm.hibernate4.HibernateTemplate;
import org.springframework.stereotype.Repository;

import com.cdac.dto.Grocery;

@Repository
public class GroceryDaoImple implements GroceryDao {

	@Autowired
	private HibernateTemplate hibernateTemplate;
	
	@Override
	public void insertGrocery(Grocery grocery) {
		hibernateTemplate.execute(new HibernateCallback<Void>() {

			@Override
			public Void doInHibernate(Session session) throws HibernateException {
				Transaction tr = session.beginTransaction();
				List<Grocery> list = selectAll(grocery.getUserId());
				boolean flag = false;
				for(Grocery li : list) {
					if(li.getItemName().equals(grocery.getItemName()) && li.getPrice() == grocery.getPrice()) {
						flag=true;
			
						break;
					}
				}
				if(flag==false) {
				
					session.save(grocery);
					tr.commit();
					session.flush();
					session.close();
					return null;
				}
				return null;	
			}
			
		});
		
	}

	@Override
	public void deleteGrocery(int groceryId) {
		hibernateTemplate.execute(new HibernateCallback<Void>() {

			@Override
			public Void doInHibernate(Session session) throws HibernateException {
				Transaction tr = session.beginTransaction();
				session.delete(new Grocery(groceryId));
				tr.commit();
				session.flush();
				session.close();
				return null;
			}
			
		});
		
	}

	@Override
	public Grocery selectGrocery(int groceryId) {
		Grocery grocery = hibernateTemplate.execute(new HibernateCallback<Grocery>() {

			@Override
			public Grocery doInHibernate(Session session) throws HibernateException {
				Transaction tr = session.beginTransaction();
				Grocery gr = (Grocery)session.get(Grocery.class, groceryId);
				tr.commit();
				session.flush();
				session.close();
				return gr;
			}
		});
		return grocery;
	}

	@Override
	public void updateGrocery(Grocery grocery) {
		hibernateTemplate.execute(new HibernateCallback<Void>() {

			@Override
			public Void doInHibernate(Session session) throws HibernateException {
				Transaction tr = session.beginTransaction();
				
				session.update(grocery);
				
				tr.commit();
				session.flush();
				session.close();
				return null;
			}
			
		});
	}

	@Override
	public List<Grocery> selectAll(int userId) {
		List<Grocery> groceryList = hibernateTemplate.execute(new HibernateCallback<List<Grocery>>() {

			@Override
			public List<Grocery> doInHibernate(Session session) throws HibernateException {
				Transaction tr = session.beginTransaction();
				Query q = session.createQuery("from Grocery where userId = ?");
				q.setInteger(0, userId);
				List<Grocery> li = q.list();
				System.out.println(li); 
				tr.commit();
				session.flush();
				session.close();
				return li;
			}
			
		});
		return groceryList;
	}

}