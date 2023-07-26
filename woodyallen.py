import requests
from bs4 import BeautifulSoup
from tabulate import tabulate

def scrape_filmography():
    # Load the cached HTML content of Woody Allen's filmography
    with open("woody_allen_filmography.html", "r", encoding="utf-8") as f:
        content = f.read()

    # Create a BeautifulSoup object to parse the HTML content
    soup = BeautifulSoup(content, "html.parser")

    # Find the table containing the filmography
    table = soup.find("table", class_="wikitable")

    # Extract the film data from the table
    filmography = []
    rows = table.find_all("tr")[1:]  # Exclude the header row
    for row in rows:
        columns = row.find_all("td")
        if len(columns) >= 3:
            title = columns[0].text.strip()
            year = columns[1].text.strip()
            genre = columns[2].text.strip()
            director = "Woody Allen"
            filmography.append([title, year, genre, director])

    return filmography

# Scrape Woody Allen's filmography
filmography_table = scrape_filmography()

# Print the filmography table
print(tabulate(filmography_table, headers=["Title", "Year", "Genre", "Director"]))
