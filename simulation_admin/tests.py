# coding=utf-8

from bs4 import BeautifulSoup
import urllib.request

school = 0
pro_code = 1
pro_name = 2
xuewei = 3
pdf = 4


def getImg(soup):
    for tr in soup.find_all('tr'):
        td = tr.find_all('td')
        try:
            urllib.request.urlretrieve(td[pdf].find('a')['href'], '%s_%s_%s_%s.pdf' % (
                td[school].text.strip(),
                td[pro_code].text.strip(),
                td[pro_name].text.strip(),
                td[xuewei].text.strip())
                                       )
        except IndexError as e:
            pass


for i in range(1, 188):
    html = "http://www.bkzy.org/Index/Declaration?intPageNo=%s" % i
    print(html)
    # page = urllib.request.urlopen(html)
    # html = page.read().decode('utf-8')
    # soup = BeautifulSoup(html, "html.parser")
    # getImg(soup)
    # print('第%s页完事...' % i)
