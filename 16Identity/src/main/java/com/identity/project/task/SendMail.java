package com.identity.project.task;

import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.stereotype.Component;

import com.identity.project.domain.MailVO;

@Component
public class SendMail {

	@Autowired
	private JavaMailSenderImpl mailSender;

	public void sendMail(MailVO vo) {
			MimeMessagePreparator mp = new MimeMessagePreparator() {
			
			@Override
			public void prepare(MimeMessage mimeMessage) throws Exception {
				MimeMessageHelper helper = new MimeMessageHelper(mimeMessage, true, "UTF-8");
				helper.setFrom(vo.getFrom());
				helper.setTo(vo.getTo());
				helper.setSubject(vo.getSubject());
				helper.setText(vo.getContent(), true);
						
				}
			};
			mailSender.send(mp); //메일을 전송합니다.
			System.out.println("메일 전송했습니다.");
	}
}
