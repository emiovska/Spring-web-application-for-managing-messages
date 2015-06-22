package mk.ukim.finki.mp.stateful.dao;

import java.util.List;




import mk.ukim.finki.mp.stateful.model.Contact;

import mk.ukim.finki.mp.stateful.sending.SendingExecutor;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ContactDaoImpl implements ContactDao {

	@Autowired
	private SessionFactory sessionFactory;
	
	@Autowired
	private SendingExecutor sendingExecutor;

	private Session getCurrentSession() {
		return sessionFactory.getCurrentSession();
	}

	@Override
	public String getNameByNumber(String number) {
		@SuppressWarnings("unchecked")
		List<Contact> res = (List<Contact>) getCurrentSession()
				.createQuery("from Contact where phoneNumber=:id")
				.setParameter("id", number).list();
		if(res!=null)
		{
			res.get(0).getName();
		}
		return null;
	}

	@Override
	public Contact getByNumber(String number) {
		@SuppressWarnings("unchecked")
		List<Contact> res = (List<Contact>) getCurrentSession()
				.createQuery("from Contact where phoneNumber=:id")
				.setParameter("id", number).list();
		
		if(res.size()==0)
			return null;
		return res.get(0);
		
		
		
		
	}

	@Override
	public double getBalance(Contact contact) {
		return sendingExecutor.getSaldo(contact);
	}

	@Override
	public List<Contact> getAll() {
		List<Contact> res = getCurrentSession().createQuery("from Contact").list();
		
		return res;
	}
	
	
	
}
