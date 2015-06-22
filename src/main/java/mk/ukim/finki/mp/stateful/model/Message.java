package mk.ukim.finki.mp.stateful.model;

import java.util.List;

import javax.persistence.*;

import org.springframework.beans.factory.annotation.Autowired;

@Entity
public class Message {
	
	@Id
	@GeneratedValue
	private int id;
	
	@ManyToMany(fetch=FetchType.EAGER)
	@JoinTable(name ="contact_sms",
	joinColumns =@JoinColumn(name = "MESSAGE_ID"),inverseJoinColumns=@JoinColumn(name = "CONTACT_NUMBER"))
	private List<Contact> contactTo;
	
	@ManyToOne
	private  Contact contactFrom;
	
	private String content;
	
	public int getId(){
		return id;
	}
	
	public void setId(int id) {
		this.id = id;
	}
	
	
	public List<Contact> getContactTo() {
		return contactTo;
	}

	public void setContactTo(List<Contact> contactTo) {
		this.contactTo = contactTo;
	}

	public Contact getContactFrom() {
		return contactFrom;
	}
	public void setContactFrom(Contact contactFrom) {
		this.contactFrom = contactFrom;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	
	
	
	
	
	
	
}
