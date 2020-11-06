package com.cdac.dao;

import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate4.HibernateCallback;
import org.springframework.orm.hibernate4.HibernateTemplate;
import org.springframework.stereotype.Repository;

import com.cdac.dto.User;

@Repository
public class UserDaoImple implements UserDao {
	
	@Autowired
	private HibernateTemplate hibernateTemplate;

	@Override
	public boolean insertUser(User user) {
		return hibernateTemplate.execute(new HibernateCallback<Boolean>() {
			boolean val = false;
			@Override
			public Boolean doInHibernate(Session session) throws HibernateException {
				Transaction tr = session.beginTransaction();
				List<User> list = selectAll();
				boolean flag = false;
				for(User li : list) {
					if(li.getEmail().equals(user.getEmail())) {
						flag=true;
						break;
					}
				}
						
				if(flag==false) {	
				session.save(user);
				tr.commit();
				session.flush();
				session.close();
				val = true;
				return val;
				}
				return val;
				}
		});
		
	}


	@Override
	public boolean checkUser(User user) {
		boolean b = hibernateTemplate.execute(new HibernateCallback<Boolean>() {

			@Override
			public Boolean doInHibernate(Session session) throws HibernateException {
				Transaction tr = session.beginTransaction();
				Query q = session.createQuery("from User where email = ? and userPass = ?");
				q.setString(0, user.getEmail());
				q.setString(1, user.getUserPass());
				List<User> li = q.list();
				boolean flag = !li.isEmpty();
				if(!li.isEmpty()) {
					flag = true;
					user.setUserId(li.get(0).getUserId()); 
					tr.commit();
					session.flush();
					session.close();
				}
				else {
					flag = false;
				}
				
				return flag;
			}
			
		});
		return b;
	}
	
	@Override
	public String forgotPassword(String email) {
		String password = hibernateTemplate.execute(new HibernateCallback<String>() {

			@Override
			public String doInHibernate(Session session) throws HibernateException {
				Transaction tr = session.beginTransaction();
				Query q = session.createQuery("from User where email = ?");
				q.setString(0, email);
				List<User> li = q.list();
				String pass = null;
				if(!li.isEmpty())
					pass = li.get(0).getUserPass();
				tr.commit();
				session.flush();
				session.close();
				return pass;
			}
			
		});
		return password;
	}

	@Override
	public List<User> selectAll() {
		List<User> userList = hibernateTemplate.execute(new HibernateCallback<List<User>>() {

			@Override
			public List<User> doInHibernate(Session session) throws HibernateException {
				Transaction tr = session.beginTransaction();
				Query q = session.createQuery("from User");

				List<User> li = q.list();
				System.out.println(li); 
				tr.commit();
				session.flush();
				session.close();
				return li;
			}
			
		});
		return userList;
		
	}
	

	public List<User> selectUser() {
		List<User> userList = hibernateTemplate.execute(new HibernateCallback<List<User>>() {

			@Override
			public List<User> doInHibernate(Session session) throws HibernateException {
				Transaction tr = session.beginTransaction();
				Query q = session.createQuery("from User");

				List<User> li = q.list();
				System.out.println(li); 
				tr.commit();
				session.flush();
				session.close();
				return li;
			}
			
		});
		return userList;
		
	}
	
	@Override
	public User getUser(int userId) {
		
		return hibernateTemplate.execute(new HibernateCallback<User>() {

			@Override
			public User doInHibernate(Session session) throws HibernateException {
				Transaction transaction = session.beginTransaction();
				
				User faculty = (User) session.get(User.class, userId);
				
				transaction.commit();
				session.flush();
				session.close();
				return faculty;
			}
			
			
		});

	}
	
	@Override
	public void uploadImage(String profilePic,int userId) {
		hibernateTemplate.execute(new HibernateCallback<Void>() {

			@Override
			public Void doInHibernate(Session session) throws HibernateException {
				Transaction tr = session.beginTransaction();
				User user = (User)session.get(User.class, userId);
				user.setProfilePic(profilePic); 
				tr.commit();
				session.flush();
				session.close();
				return null;
			}
			
		});
	}

	
}