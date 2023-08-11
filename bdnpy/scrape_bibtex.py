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

if __name__ == "__main__":
    url = "https://scholar.harvard.edu/shleifer/publications"
    publications = scrape_publications(url)

    if publications:
        # Printing the extracted BibTeX data
        for title, bibtex_content in publications:
            print(f"Title: {title}\nBibTeX:\n{bibtex_content}\n\n")
