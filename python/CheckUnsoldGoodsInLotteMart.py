#-*- coding: utf-8 -*-

########################################################
# Check that unsold goods in LotteMart are stocked or not.
#
# sMiLo / 2015.12.30
########################################################

from bs4 import BeautifulSoup
from urllib2 import urlopen, URLError
import mechanize
import sys
import smtplib
from email.mime.text import MIMEText

########################################################

SMTP_SERVER_ADDR = 'smtp.gmail.com'
SMTP_SERVER_PORT = 465
SMTP_SERVER_ID = 'ID_HERE'
SMTP_SERVER_PW = 'PW_HERE'

EMAIL_SENDER = 'EMAIL_SENDER'
EMAIL_RECEIVER = 'EMAIL_RECEIVER'

ITEM_URL = 'http://toysrus.lottemart.com/product/ProductDetail.do?&ProductCD=8809351921048'

########################################################
def send_mail(email_receiver, subject, text):
	msg = MIMEText(text)
	msg['Subject'] = subject
	msg['From'] = EMAIL_SENDER
	msg['To'] = email_receiver

	s = smtplib.SMTP_SSL(SMTP_SERVER_ADDR, SMTP_SERVER_PORT)
	s.login(SMTP_SERVER_ID, SMTP_SERVER_PW)
	s.sendmail(EMAIL_SENDER, email_receiver, msg.as_string())
	s.quit()

########################################################
if __name__ == '__main__':
	
	# Set encoding to UTF-8
	reload(sys)
	sys.setdefaultencoding('utf-8')

	# Parse given html file using BeautifulSoup
	try:
		response = mechanize.urlopen(ITEM_URL)
	except URLError, e:
		if hasattr(e, 'code'):
			if e.code==408:
				print 'Timeout ', ITEM_URL
			elif e.code==404:
				print 'File Not Found ', ITEM_URL
		sys.exit(0)
	data = response.read()
	soup = BeautifulSoup(data, "html.parser")
	title = soup.title.string
	
	# Check
	if title.find(u'미판매상품 안내페이지') == 0:
		print 'unsold'
	else:
		subject = '입고! [%s]' % title
		send_mail(EMAIL_RECEIVER, subject, ITEM_URL)
	
	# Close Client cookie
	response.close()
