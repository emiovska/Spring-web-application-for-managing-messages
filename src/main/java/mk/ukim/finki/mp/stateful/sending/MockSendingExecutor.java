package mk.ukim.finki.mp.stateful.sending;

import java.util.List;

import mk.ukim.finki.mp.stateful.dao.ContactDao;
import mk.ukim.finki.mp.stateful.model.Contact;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class MockSendingExecutor implements SendingExecutor{

	
	@Autowired
	ContactDao contactDao;
	
	@Override
	public double getSaldo(Contact contact) {
		return 100.0;
	}

	@Override
	public double sendSMS(Contact numberFrom, Contact numberTo, String smsBody) {
		System.out.println("sending..");
		return 5.0;
	}

	@Override
	public boolean validation(String from, List<String> to) {
		
		if(contactDao.getByNumber(from)==null)
			return false;
		
		for(String c: to)
		{
			if(contactDao.getByNumber(c)==null)
				return false;
		}
		
		
		return true;
	}

	

}
