package mk.ukim.finki.mp.stateful.controller;


import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import mk.ukim.finki.mp.stateful.service.ContactService;
import mk.ukim.finki.mp.stateful.service.MessageService;
import mk.ukim.finki.mp.stateful.model.Contact;
import mk.ukim.finki.mp.stateful.model.Message;



import org.hibernate.Session;
import org.hsqldb.result.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping(value = "/sms")
@SessionAttributes(value = { "number","saldo","contact","numbers"})
public class SmsController {

	@Autowired
	ContactService contactService;
	
	@Autowired
	MessageService messageService;

	@RequestMapping(value = "/*")
	public String invalid() {
		
		return "redirect:insertPhoneNumber";
	}
	
	
	@RequestMapping(value = {"newsmstab"}, method = RequestMethod.GET)
	@Secured("ROLE_CLIENT")
	public ModelAndView newsmstab(HttpSession session,HttpServletRequest request){
	// redirecting...	
		Cookie cookie=cookieExist(request);
		if(cookie!=null){
				session.setAttribute("contact", contactService.getContactByNumber(cookie.getValue()));			
		}
		else{
		
			if(session.getAttribute("contact")==null){
					
				ModelAndView insert= new ModelAndView("insertPhoneNumber");
					return insert;
			}
			
		}
		
	//end..	
		
		ModelAndView newSms = new ModelAndView("newsmstab");
		
		Contact contact=(Contact)session.getAttribute("contact"); 
		List<Contact> allContacts= contactService.getAllContacts();
	
		StringBuilder builder = new StringBuilder();
		for(Contact c: allContacts)
		{
			builder.append("\""+ c.getPhoneNumber() + "\"" + ",");
		}
		builder.deleteCharAt(builder.length()-1);
		
		newSms.addObject("numbers",builder.toString());
		newSms.addObject("contact",contact);
		
		return newSms;
	}
	
	@RequestMapping(value = {"newsmstab"}, method = RequestMethod.POST)
	@Secured("ROLE_CLIENT")
	public ModelAndView saveMessages(HttpSession session,@RequestParam String numberFrom, @RequestParam String numberTo, @RequestParam String content){
		
		Contact contactFrom=contactService.getContactByNumber(numberFrom);
	
		double newsaldo=(double)session.getAttribute("saldo");
		ArrayList<String> cc= new ArrayList<String>();
		String []contacts=numberTo.split(",");
		for(int i=0;i<contacts.length;i++)
		{
			cc.add(contacts[i]);
		}
		
		boolean flag=messageService.validateContacts(numberFrom, cc);
		ModelAndView result = new ModelAndView("newsmstab");
		
		if(flag==true)
		{
				List<Contact> contactsTo= new ArrayList<Contact>();
				
				for(int i=0;i<contacts.length;i++){
					Contact contactTo=contactService.getContactByNumber(contacts[i]);
				    contactsTo.add(contactTo);
				}
				
				newsaldo-=messageService.sendMessage(contactFrom, contactsTo, content);
				result.addObject("saldo", newsaldo);
				result.addObject("message", "Вашата порака беше успешно испратена");
				
				return result;
	
		}
		
		result.addObject("saldo",newsaldo);
		result.addObject("message", "Вашата порака не беше успешно пратена");
		
		return result;
		
		
	}
		

@RequestMapping(value = {"sentsmstab"}, method = RequestMethod.GET)
@Secured("ROLE_CLIENT")
	public ModelAndView sentsmstab(HttpSession session, HttpServletRequest request){
	//redirecting...
	Cookie cookie=cookieExist(request);
	if(cookie!=null)
	{
			session.setAttribute("contact", contactService.getContactByNumber(cookie.getValue()));
			
	}
	else
	{
		if(session.getAttribute("contact")==null){
				
			ModelAndView insert= new ModelAndView("insertPhoneNumber");
				return insert;
		}
		
	}
	
	//end redirecting...

		ModelAndView sentSms = new ModelAndView("sentsmstab");
		Contact t = (Contact)session.getAttribute("contact");
		Contact c = contactService.getContactByNumber(t.getPhoneNumber());
	
		List<Message> messages = c.getMessagesSend();
		Collections.reverse(messages);
		sentSms.addObject("allSms",messages);
		return sentSms;
	}
	

@RequestMapping(value = {"receivesmstab"}, method = RequestMethod.GET)
@Secured("ROLE_CLIENT")
public ModelAndView receivesmstab(HttpSession session,HttpServletRequest request){
	
	//redirecting...
	Cookie cookie=cookieExist(request);
	if(cookie!=null)
	{
			session.setAttribute("contact", contactService.getContactByNumber(cookie.getValue()));
			
	}
	else
	{
		if(session.getAttribute("contact")==null){
				
			ModelAndView insert= new ModelAndView("insertPhoneNumber");
				return insert;
		}
		
	}
	
	
	//end redirecting...
	
	
	ModelAndView sentSms = new ModelAndView("receivesmstab");
	
	Contact t = (Contact)session.getAttribute("contact");
	Contact c = contactService.getContactByNumber(t.getPhoneNumber());
	
	List<Message> sms=c.getMessagesReceive();
	Collections.reverse(sms);
	sentSms.addObject("allSms",sms);
	
	return sentSms;
}
	
	
	
	
	
	@RequestMapping(value = { "insertPhoneNumber" })
	@Secured({"ROLE_CLIENT","ROLE_ADMIN"})
	public ModelAndView insertNumber(HttpServletResponse response, HttpServletRequest request,HttpSession session) {
		
		if(request.isUserInRole("ROLE_ADMIN"))
			return new ModelAndView("adminview");
		
		
		Cookie cookie=cookieExist(request);
		
	        if(cookie!=null){
	        	
	        		Contact contact= contactService.getContactByNumber(cookie.getValue());
	        		ModelAndView result = new ModelAndView("receivesmstab");
	        		//session.setAttribute("contact", contact);
	        		
	        		
	        	
	        		List<Message> messages = contact.getMessagesReceive();
	        	Collections.reverse(messages);
	        		
	        		result.addObject("allSms",messages);	
	        		result.addObject("saldo",contactService.getBalance(contact));
	        		result.addObject("contact",contact);
	        		result.addObject("slado", contactService.getBalance(contact));
	        		return result;
	        }
		
		
		ModelAndView result = new ModelAndView("insertPhoneNumber");
		
		
		return result;
	}
	
	@RequestMapping(value = { "number" })
	@Secured("ROLE_CLIENT")
	public ModelAndView test(String number, String remember,HttpServletResponse response,HttpSession session, HttpServletRequest request) {
		ModelAndView result = new ModelAndView("receivesmstab");
	
		//System.out.println("tuka");
		Contact contact= contactService.getContactByNumber(number);
		if(remember==null)
		{
			Cookie[] cookies = request.getCookies();
	        for(int i = 0; i< cookies.length ; ++i){
	            if(cookies[i].getName().equals("number")){
	                cookies[i].setMaxAge(0);
	                response.addCookie(cookies[i]);
	                break;
	            }
	        } 
		}
		
		if(contact==null)
		{
			ModelAndView rez= new ModelAndView("insertPhoneNumber");
			rez.addObject("error", "Не сте овластени за користење на оваа апликација");
			return rez;
		}
		
		if(remember!=null)
		{
			Cookie cookie;
			cookie=new Cookie("number", number);
			cookie.setMaxAge(300);	
			response.addCookie(cookie);
			
		}
		
		result.addObject("contact",contact);
		result.addObject("saldo", contactService.getBalance(contact));
		List<Message> messages=contact.getMessagesReceive();
		Collections.reverse(messages);
		result.addObject("allSms",messages);
		
		
		return result;
	}
	

	
	
	
	@RequestMapping(value = "/msg/{phoneNumber}", method = RequestMethod.GET)
	@Secured("ROLE_CLIENT")
	public ModelAndView allMessagesTo(@PathVariable String phoneNumber,HttpSession session, HttpServletRequest request){
		
	Cookie cookie=cookieExist(request);
		if(cookie!=null)
		{
				session.setAttribute("contact", contactService.getContactByNumber(cookie.getValue()));
				
		}
		else
		{
			if(session.getAttribute("contact")==null){
					
				ModelAndView insert= new ModelAndView("insertPhoneNumber");
					return insert;
			}
			
		}
		
		ModelAndView result= new ModelAndView("filterMsg");
		Contact c = (Contact)session.getAttribute("contact");
		Contact contact=contactService.getContactByNumber(c.getPhoneNumber());
		Contact to= contactService.getContactByNumber(phoneNumber);
		
		List<Message> msgTo=messageService.allMessageSentTo(c.getPhoneNumber(), phoneNumber);
		result.addObject("msgTo", msgTo);	
		result.addObject("receiver", to.getName());
		
		List<Message> msgFrom = messageService.allMessageSentTo(phoneNumber, c.getPhoneNumber());
		result.addObject("msgFrom", msgFrom);
		result.addObject("sender", c.getName());
			
		return result;
		
	}
	
	
	@RequestMapping(value = { "changeNumber" })
	@Secured("ROLE_CLIENT")
	public ModelAndView changeNumber(){
		
		ModelAndView result= new ModelAndView("insertPhoneNumber");
		return result;
		
	}
	
	
	private Cookie cookieExist(HttpServletRequest request)
	{
		
		Cookie[] cookies = request.getCookies();
		for (Cookie cookie : cookies) {
			//System.out.println(cookie.getName());
	        if(cookie.getName().equals("number")){
	        	return cookie;
	        }
	    }
		
	
		return null;
	}
	
	
	
	
	
	//admin
	
	@RequestMapping(value = "/admin", method = RequestMethod.GET)
	@Secured("ROLE_ADMIN")
	public ModelAndView admin() {
		System.out.println("admin");
		ModelAndView adminview= new ModelAndView("adminview");
		
		return adminview;
		
		
	}
	
	@RequestMapping(value = "/receive", method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE)
	@Secured("ROLE_ADMIN")
	@ResponseBody
	public  String adminreceive( @RequestBody String body,HttpServletResponse res) {
		String parts[]= body.split(",");
		String from[]=parts[0].split(":");
		StringBuilder FromContact = new StringBuilder(from[1]);
		FromContact.deleteCharAt(0);
		FromContact.deleteCharAt(FromContact.length()-1);
		
		String to[]=parts[1].split(":");
		StringBuilder toContact = new StringBuilder(to[1]);
		toContact.deleteCharAt(0);
		toContact.deleteCharAt(toContact.length()-1);
		System.out.println("contact-from:" + FromContact);
		System.out.println("contact-to:" + toContact);
		
		String[] content=parts[2].split(":");
		StringBuilder contentbuilder=new StringBuilder(content[1]);
		contentbuilder.deleteCharAt(0);
		contentbuilder.deleteCharAt(contentbuilder.length()-1);
		contentbuilder.deleteCharAt(contentbuilder.length()-1);
		
		System.out.println("content:" + contentbuilder);
		ArrayList<String> too= new ArrayList<String>();
		too.add(toContact.toString());
		
		boolean flag=messageService.validateContacts(FromContact.toString(), too);
		
		if(flag==true){
			Contact fromCon=contactService.getContactByNumber(FromContact.toString());
			Contact toCon=contactService.getContactByNumber(toContact.toString());
			ArrayList<Contact> cons=new ArrayList<Contact>();
			cons.add(toCon);
			messageService.sendMessage(fromCon, cons, contentbuilder.toString());
			return "{\"status\": \"1\"}";
		}
		
		return "{\"status\": \"0\"}";
					
		
	}
	
	
	@RequestMapping(value = { "accessDenied" })
	
	public ModelAndView customErrorView()
	{
		ModelAndView view = new ModelAndView("errorview");
		return view;
	}
	
	@RequestMapping(value = { "login" })
	
	public ModelAndView customLogin(ModelMap model)
	{
		ModelAndView login = new ModelAndView("login");
		return login;
	}
	@RequestMapping(value="/loginfailed", method = RequestMethod.GET)
	public String loginerror(ModelMap model) {
 
		model.addAttribute("error", "Невалидно корисничко име или лозинка");
		return "login";
 
	}
	
	@RequestMapping(value = { "default" })
	
	public String urlHandler(HttpServletRequest request) {
		System.out.println("default");
		 if (request.isUserInRole("ROLE_ADMIN")) {
	            return "redirect:admin";
	        }
		 else
			
	        return "redirect:insertPhoneNumber";
		
	}

}
