package mk.ukim.finki.mp.stateful.sending;

import java.util.List;

import mk.ukim.finki.mp.stateful.model.Contact;

public interface SendingExecutor {
	public double sendSMS(Contact numberFrom, Contact numberTo, String smsBody);
	public double getSaldo(Contact contact);
	public boolean validation(String from, List<String> to);
}
