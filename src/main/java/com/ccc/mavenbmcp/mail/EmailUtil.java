/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ccc.mavenbmcp.mail;

import java.io.UnsupportedEncodingException;
import java.util.Date;
import javax.activation.DataHandler;
import javax.activation.DataSource;
import javax.activation.FileDataSource;
import javax.mail.BodyPart;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;

/**
 *
 * @author davidchang
 */
public class EmailUtil {

    public static void sendEmail(Session session, String toEmail, String fromEmail, String replyID, String subject, String body) {
        try {
            MimeMessage message = new MimeMessage(session);
            message.addHeader("Content-type", "text/html; charset=UTF-8");
            message.addHeader("format", "flowed");
            message.addHeader("Content-Transfer-Encoding", "8bit");
            message.setFrom(new InternetAddress(fromEmail, replyID));
            message.setReplyTo(InternetAddress.parse(fromEmail, false));
            message.setSubject(subject, "UTF-8");
            message.setText(body, "UTF-8");
            message.setSentDate(new Date());
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(toEmail, false));
            message.setRecipients(Message.RecipientType.CC, "");
            message.setRecipients(Message.RecipientType.BCC, "");
            System.out.println("Message is ready!");
            Transport.send(message);
        } catch (MessagingException e) {
            throw new RuntimeException(e);
        } catch (UnsupportedEncodingException e) {
            throw new RuntimeException(e);
        }
    }

    public static void sendAttachmentEmail(Session session, String toEmail, String subject, String body) {
        try {
            MimeMessage message = new MimeMessage(session);
            message.addHeader("Content-type", "text/html; charset=UTF-8");
            message.addHeader("format", "flowed");
            message.addHeader("Content-Transfer-Encoding", "8bit");
            message.setFrom(new InternetAddress("chechiachang999@gmail.com", "NoReply-JD"));
            message.setReplyTo(InternetAddress.parse("jhooooo999@gmail.com", false));
            message.setSubject(subject, "UTF-8");
            message.setSentDate(new Date());
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(toEmail, false));
            //Create the message ody part
            BodyPart messageBodyPart = new MimeBodyPart();
            //Fill the message
            messageBodyPart.setText(body);
            //Create a nultipart message for attachment
            Multipart multipart = new MimeMultipart();
            //Set text message part
            multipart.addBodyPart(messageBodyPart);
            //Second part is attachment
            messageBodyPart = new MimeBodyPart();
            String filename = "abc.txt";
            DataSource source = new FileDataSource(filename);
            messageBodyPart.setDataHandler(new DataHandler(source));
            messageBodyPart.setFileName(filename);
            multipart.addBodyPart(messageBodyPart);
            //Send the complete message parts
            message.setContent(multipart);
            //Send message
            Transport.send(message);
            System.out.println("Email sent Succefully with attachment!!");
        } catch (MessagingException e) {
            throw new RuntimeException(e);
        } catch (UnsupportedEncodingException e) {
            throw new RuntimeException(e);
        }
    }

    public static void sendImageEmail(Session session, String toEmail, String subject, String body) {
        try {
            MimeMessage message = new MimeMessage(session);
            message.addHeader("Content-type", "text/html; charset=UTF-8");
            message.addHeader("format", "flowed");
            message.addHeader("Content-Trnsfer-Encoding", "8bit");

            message.setFrom(new InternetAddress("chechiachang999@gmail.com", "NoReply-JD"));
            message.setReplyTo(InternetAddress.parse("jhooooo999@hotmail.com", false));
            message.setSubject(subject, "UTF-8");
            message.setSentDate(new Date());
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(toEmail, false));
            //Create the message body
            BodyPart messageBodyPart = new MimeBodyPart();
            messageBodyPart.setText(body);
            //Create a multipart message
            Multipart multipart = new MimeMultipart();
            //Set text message part
            multipart.addBodyPart(messageBodyPart);
            //Second part is image attachment
            messageBodyPart = new MimeBodyPart();
            String filename = "image.png";
            DataSource source = new FileDataSource(filename);
            messageBodyPart.setDataHandler(new DataHandler(source));
            messageBodyPart.setFileName(filename);
            //Trick is to add the conten-id header here
            messageBodyPart.setHeader("Content-ID", "image_id");
            multipart.addBodyPart(messageBodyPart);
            //third part for displaying image in the email body
            messageBodyPart = new MimeBodyPart();
            messageBodyPart.setContent("<h1>Attached Image</h1><img src='cid:image_id'>", "text/html");
            multipart.addBodyPart(messageBodyPart);
            //set the multipart message to email message
            message.setContent(multipart);

            //Send message
            Transport.send(message);
            System.out.println("Email Sent Successfully with image!!");

        } catch (MessagingException e) {
            throw new RuntimeException(e);
        } catch (UnsupportedEncodingException e) {
            throw new RuntimeException(e);
        }
    }
}
