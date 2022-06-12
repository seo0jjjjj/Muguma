package mail;

import java.util.Properties;
import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import dao.UserDAO;

/// 인증메일 보내기 기능있는 싱글톤 클래스
public class MailSender {
	
	private final String FROM = "seo0jjjjj@naver.com"; // 실제로 보내는 내 계정 ..ㅠ
	private final String FROMNAME = "MuguMa 고객센터"; // 보낸 사람 프로필
	private String to = ""; // 받을 이메일 주소
	private final String SMTP_USERNAME = "seo0jjjjj"; // 보내는 계정 아이디
	private final String SMTP_PASSWORD = "4578wan!"; // 보내는 계정 비밀번호
	private String verification_code; // 인증번호
	private final String HOST = "smtp.naver.com"; // smtp 네이버
	private final int PORT = 587; // 네이버 smtp 포트
	static final String SUBJECT = "비밀번호 초기화 인증 메일입니다."; // 제목
	private String BODY = String.join(System.getProperty("line.separator"), "<h1>무그마 고객센터</h1>",
			"<p>계정 인증 메일 입니다. 아래의 코드를 입력해주세요.</p>."); // 메일 Body
	// 싱글톤을 위한 작업
	private static MailSender instance;

	private MailSender() {
	}

	static {
		try {
			instance = new MailSender();
		} catch (Exception e) {
			throw new RuntimeException("Exception MailSender 인스턴스 생성 오류");
		}
	}

	// 싱글톤
	public static MailSender getInstance() {
		return instance;
	}// 싱글톤을 위한 작업

	



	public String sendMail(String to) throws Exception {
		this.to = to;
		//인증 문자 생성
		verification_code = HashCreater.createRandomString();
		
		Properties props = System.getProperties();
		props.put("mail.transport.protocol", "smtp");
		props.put("mail.smtp.port", PORT);
		props.put("mail.smtp.starttls.enable", "true");
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.ssl.protocols", "TLSv1.2");
		//세션 객체 생성
		Session session = Session.getDefaultInstance(props);
		MimeMessage msg = new MimeMessage(session);
		//msg 설정
		msg.setFrom(new InternetAddress(FROM, FROMNAME));
		msg.setRecipient(Message.RecipientType.TO, new InternetAddress(to));
		msg.setSubject(SUBJECT);
		msg.setContent((BODY+"<h2>인증 코드 :" +verification_code +"</h2>"), "text/html;charset=euc-kr");

		Transport transport = session.getTransport();
		try {
			System.out.println("[MailSender] 이메일 보내는중.. ");
			transport.connect(HOST, SMTP_USERNAME, SMTP_PASSWORD);
			transport.sendMessage(msg, msg.getAllRecipients());
			System.out.println("▶ 인증 Email 전송됨 (인증번호:"+verification_code+")");
		} catch (Exception ex) {
			ex.printStackTrace();
			verification_code = "error";
		} finally {
			transport.close();
			return verification_code;
		}
	}
}