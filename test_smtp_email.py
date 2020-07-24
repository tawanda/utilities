#last tested 2020

import smtplib


def send_email(user, pwd, recipient, subject, body):
    

    FROM = user
    TO = recipient if isinstance(recipient, list) else [recipient]
    SUBJECT = subject
    TEXT = body

    # Prepare actual message
    message = """From: %s\nTo: %s\nSubject: %s\n\n%s
    """ % (FROM, ", ".join(TO), SUBJECT, TEXT)
    try:
        print('Starting SMTP connection')
        server = smtplib.SMTP("smtp.server.com", 587)
        print('Sending hello')
        server.ehlo()
        print('Start TLS')
        #server.starttls()
        print('Login')
        server.login(user, pwd)
        print('Sending mail..')
        server.sendmail(FROM, TO, message)
        print('Closing connection')
        server.close()
        print('successfully sent the mail')
    except Exception as er:
        print("failed to send mail -" + str(er))


user = ''
pwd =  ''
recipient = ''

subject = 'test'
body = 'testing mail'

send_email(user, pwd, recipient, subject, body)
