package mk.ukim.finki.mp.stateful.service;

import java.util.List;

import mk.ukim.finki.mp.stateful.model.Contact;

public interface ContactService {

	public Contact getContactByNumber(String phonenumer);
	public String getContactNameByNumber(String phonenumber);
	public double getBalance(Contact contact);
	public List<Contact> getAllContacts();
}
