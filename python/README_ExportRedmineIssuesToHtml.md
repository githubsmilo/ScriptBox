ExportRedmineIssuesToHtml
===================
Collect contents of given issue list and export them to the HTML file.

- To use this script, update below items according to your circumstances.
 - USER\_ID : redmine user id
 - USER\_PW : redmine user password
 - ISSUE\_LIST : issue list
 - URL\_LOGIN : redmine login url
 - URL\_ISSUE : redmine issue url
 - RESULT\_FILE : result file name

- Tested on Redmine 1.3.2.stable
 
- Coded with Python 2.7.3. Needed below packages.
 - BeautifulSoup (http://www.crummy.com/software/BeautifulSoup)
 - Mechanize (http://wwwsearch.sourceforge.net/mechanize)
 - ClientForm (http://wwwsearch.sourceforge.net/old/ClientForm)
