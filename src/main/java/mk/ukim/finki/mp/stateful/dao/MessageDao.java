package mk.ukim.finki.mp.stateful.dao;

import java.util.List;

import mk.ukim.finki.mp.stateful.model.Contact;
import mk.ukim.finki.mp.stateful.model.Message;

public interface MessageDao {

	public double sendMessage(Contact from, List<Contact> to, String content);
	public boolean validateContacts(String from, List<String> to);
	
}
