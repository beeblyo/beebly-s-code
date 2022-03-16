package mail;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

public class NaverMail extends Authenticator
{
	protected PasswordAuthentication getPasswordAuthentication()
	{
		return new PasswordAuthentication("ego7302@naver.com" ,"@ego730296");
	}
}
