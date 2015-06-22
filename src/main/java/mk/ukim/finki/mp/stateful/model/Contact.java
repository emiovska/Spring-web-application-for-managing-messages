package mk.ukim.finki.mp.stateful.model;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;

import org.hibernate.annotations.Cascade;

@Entity
public class Contact {

	@Id
	private String phoneNumber;
	
	private String name;
	
	@OneToMany(mappedBy="contactFrom", cascade=CascadeType.ALL, fetch=FetchType.EAGER)
	private List<Message> messagesSend;
	
	@ManyToMany(fetch=FetchType.EAGER)
	@JoinTable(name ="contact_sms",
	joinColumns =@JoinColumn(name = "CONTACT_NUMBER"),inverseJoinColumns=@JoinColumn(name = "MESSAGE_ID"))
	private List<Message> messagesReceive;

	public List<Message> getMessagesSend() {
		return messagesSend;
	}

	public void setMessagesSend(List<Message> messagesSend) {
		this.messagesSend = messagesSend;
	}

	public List<Message> getMessagesReceive() {
		return messagesReceive;
	}

	public void setMessagesReceive(List<Message> messagesReceive) {
		this.messagesReceive = messagesReceive;
	}

	public String getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	
	
	
	
	
}
