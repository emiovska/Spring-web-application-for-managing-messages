package mk.ukim.finki.mp.stateful.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import mk.ukim.finki.mp.stateful.dao.ContactDao;
import mk.ukim.finki.mp.stateful.dao.MessageDao;
import mk.ukim.finki.mp.stateful.model.Contact;
import mk.ukim.finki.mp.stateful.model.Message;

@Service
@Transactional
public class MessageServiceImpl implements MessageService{

	@Autowired
	private MessageDao messageDao;
	
	@Autowired
	private ContactDao contactDao;
	
	@Override
	public double sendMessage(Contact from, List<Contact> to, String content) {
		
		return messageDao.sendMessage(from, to, content);
	}

	@Override
	public List<Message> allMessageSentTo(String numberFrom, String numberTo) {
		Contact from=contactDao.getByNumber(numberFrom);
		Contact to= contactDao.getByNumber(numberTo);
		List<Message> msgTo= from.getMessagesSend();
		
		List<Message> filteredmsg=new ArrayList<Message>();
		for(Message m : msgTo)
		{
			if(m.getContactTo().contains(to))
			{
				filteredmsg.add(m);
			}
		}
		
		
		return filteredmsg;
	}

	@Override
	public boolean validateContacts(String from, List<String> to) {
		return messageDao.validateContacts(from, to);
	}

}
