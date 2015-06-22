package mk.ukim.finki.mp.stateful.service;

import java.util.List;

import mk.ukim.finki.mp.stateful.model.Contact;
import mk.ukim.finki.mp.stateful.model.Message;

public interface MessageService {



	public double sendMessage(Contact from, List<Contact> to, String content);
	public List<Message> allMessageSentTo(String numberFrom, String numberTo);
	public boolean validateContacts(String from, List<String> to);
}
