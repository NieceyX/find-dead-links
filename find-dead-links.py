import requests
from pathlib import Path
from sys import argv
from bs4 import BeautifulSoup


def crawl(url, levels):
	try:
		r = requests.get(url)
		if r.status_code not in [200, 302]:
			print(url)
		elif r.status_code in [200, 302]:
			if levels >= 0:
				soup = BeautifulSoup(r.text, features='html.parser')
				results = soup.find_all('a', href=True)
				for result in results:
					if result['href'].startswith('http'):
						crawl(result['href'], int(levels-1))
					else:
						end = result['href']
						if end.startswith('/'):
							end = end[1:]
						newurl = url + end
						crawl(newurl, levels-1)
	except:
		print(url)


if __name__=='__main__':
	progname = Path(argv[0]).stem

	if len(argv) not in [2,3]:
		print("Usage: %s <url>" % progname)
		print("Usage: %s -<numLevels> <url>" % progname)
		exit(1)

	if argv[1].startswith('-'):
		url = argv[2]
		levels = argv[1].replace('-', '')
	else:
		url = argv[1]
		levels = 0

	crawl(url, int(levels))
