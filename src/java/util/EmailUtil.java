package util;

import java.util.Properties;

import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;

import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class EmailUtil {

    public static void sendEmail(
        String toEmail,
        String name,
        String department,
        double salary,String username,String generatedPassword) {

        final String fromEmail =
                "musiaddy@gmail.com";

        final String password =
                "ighhehidrsacctgl";

        Properties props = new Properties();

        props.put("mail.smtp.host",
                "smtp.gmail.com");

        props.put("mail.smtp.port",
                "587");

        props.put("mail.smtp.auth",
                "true");

        props.put("mail.smtp.starttls.enable",
                "true");

        Session session =
        Session.getInstance(props,

        new javax.mail.Authenticator() {

            protected PasswordAuthentication
            getPasswordAuthentication() {

                return new PasswordAuthentication(
                        fromEmail,
                        password
                );
            }
        });

        try {

            Message message =
                    new MimeMessage(session);

            message.setFrom(
                    new InternetAddress(fromEmail));

            message.setRecipients(
                    Message.RecipientType.TO,

                    InternetAddress.parse(toEmail)
            );

            message.setSubject(
                    "Employee Added Successfully"
            );

            double hra = salary * 0.20;

double da = salary * 0.10;

double bonus = salary * 0.05;

double total =
salary + hra + da + bonus;

String payslip = "EMPLOYEE ACCOUNT CREATED\n\n" +

"LOGIN CREDENTIALS\n\n" +

"Username: " + username + "\n" +

"Password: " + generatedPassword + "\n\n" +

"EMPLOYEE PAYSLIP\n\n" +
"Employee Name: " + name + "\n" +
"Department: " + department + "\n\n" +

"Basic Salary: " + salary + "\n" +

"HRA (20%): " + hra + "\n" +

"DA (10%): " + da + "\n" +

"Bonus (5%): " + bonus + "\n\n" +

"Total Salary: " + total;

message.setText(payslip);
            Transport.send(message);

            System.out.println("Email Sent!");

        } catch(Exception e) {

            e.printStackTrace();

        }
    }
}