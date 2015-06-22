package mk.ukim.finki.mp.stateful.dao;

import java.util.List;

import mk.ukim.finki.mp.stateful.model.Contact;

public interface ContactDao {
	public String getNameByNumber(String number);
	public Contact getByNumber(String number);
	public double getBalance(Contact contact);
	public List<Contact> getAll();
}
