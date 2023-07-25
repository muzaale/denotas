import requests
from bs4 import BeautifulSoup

def scrape_publications(url):
    response = requests.get(url)
    if response.status_code != 200:
        print("Failed to fetch the page.")
        return None

    soup = BeautifulSoup(response.content, 'html.parser')
    bib_items = soup.find_all('div', {'class': 'simplenode-title'})
    
    bibtex_data = []
    for item in bib_items:
        title = item.find('a').text.strip()
        bibtex_link = item.find('a')['href']
        
        bibtex_response = requests.get(bibtex_link)
        if bibtex_response.status_code == 200:
            bibtex_content = bibtex_response.text
            bibtex_data.append((title, bibtex_content))
    
    return bibtex_data

def generate_html_file(data):
    html_content = "<html><body>"
    for title, bibtex_content in data:
        html_content += f"<h2>Title: {title}</h2><pre>{bibtex_content}</pre>"
    html_content += "</body></html>"

    with open("bibtex_data.html", "w", encoding="utf-8") as html_file:
        html_file.write(html_content)

if __name__ == "__main__":
    url = "https://scholar.harvard.edu/shleifer/publications"
    publications = scrape_publications(url)

    if publications:
        generate_html_file(publications)
