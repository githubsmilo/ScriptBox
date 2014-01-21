ExportRedmineIssuesToHtml
===================
Collect contents of issues defined in given range _**sequentially**_ and export them to the HTML file.

- To use this script, update below items according to your circumstances.
 - USER\_ID : redmine user id
 - USER\_PW : redmine user password
 - ISSUE\_NUM\_START : issue number to start
 - ISSUE\_NUM\_FINISH : issue number to finish
 - URL\_LOGIN : redmine login url
 - URL\_ISSUE : redmine issue url
 - RESULT\_FILE : result file name

- Tested on Redmine 1.3.2.stable
 
- Coded with Python 2.7.3. Needed below packages.
 - BeautifulSoup (http://www.crummy.com/software/BeautifulSoup)
 - ClientCookie (http://wwwsearch.sourceforge.net/old/ClientCookie)
 - ClientForm (http://wwwsearch.sourceforge.net/old/ClientForm)
