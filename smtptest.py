#!/usr/bin/python

import smtplib

to = 'test@example.com'
user = 'username'
pwd = 'password'
smtpserver = smtplib.SMTP("smtp.sendgrid.net",587)
smtpserver.ehlo()
smtpserver.starttls()
smtpserver.ehlo
smtpserver.login(user, pwd)
header = 'To:' + to + '\n' + 'From: ' + user + '\n' + 'Subject:testing \n'
print header
msg = header + '\n this is test msg from siege.ai\n\n'
smtpserver.sendmail(user, to, msg)
print 'done!'
smtpserver.close()
