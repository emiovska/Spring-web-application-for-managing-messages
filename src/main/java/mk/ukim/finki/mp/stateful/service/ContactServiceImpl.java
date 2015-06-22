package mk.ukim.finki.mp.stateful.service;

import java.util.List;

import mk.ukim.finki.mp.stateful.dao.ContactDao;
import mk.ukim.finki.mp.stateful.model.Contact;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class ContactServiceImpl implements ContactService{

	@Autowired
	ContactDao contactDao;

	@Override
	public Contact getContactByNumber(String phonenumer) {
		return contactDao.getByNumber(phonenumer);
	}

	@Override
	public String getContactNameByNumber(String phonenumber) {
		
		return contactDao.getNameByNumber(phonenumber);
	}

	@Override
	public double getBalance(Contact contact) {
		return contactDao.getBalance(contact);
	}

	@Override
	public List<Contact> getAllContacts() {
		return contactDao.getAll();
	}
}
