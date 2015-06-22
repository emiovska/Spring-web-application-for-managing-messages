package mk.ukim.finki.mp.stateful.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import mk.ukim.finki.mp.stateful.model.Contact;
import mk.ukim.finki.mp.stateful.model.Message;
import mk.ukim.finki.mp.stateful.sending.SendingExecutor;

@Repository
public class MessageDaoIml implements MessageDao{

	@Autowired
	private SessionFactory sessionFactory;
	
	@Autowired
	private SendingExecutor sendingExecutor;

	private Session getCurrentSession() {
		return sessionFactory.getCurrentSession();
	}
	
	@Override
	public double sendMessage(Contact from, List<Contact> to, String content) {
		Message msg= new Message();
		msg.setContactFrom(from);
		msg.setContactTo(to);
		msg.setContent(content);
		getCurrentSession().save(msg);
		
		
		
		double saldo=0;
		for(Contact contact: to)
		{
			saldo+=sendingExecutor.sendSMS(from, contact, content);
		}
		return saldo;
	}

	@Override
	public boolean validateContacts(String from, List<String> to) {
		return sendingExecutor.validation(from, to);
	}

}
