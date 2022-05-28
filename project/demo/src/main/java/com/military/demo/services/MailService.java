package com.military.demo.services;

import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Component;

import lombok.RequiredArgsConstructor;

@Component
@RequiredArgsConstructor
public class MailService {
    
    private final JavaMailSender mailSender;

    public void sendMail() {
        SimpleMailMessage message = new SimpleMailMessage();
        message.setTo("sungyu623@naver.com");
        message.setSubject("title");
        message.setText("message");

        mailSender.send(message);
    }
}
