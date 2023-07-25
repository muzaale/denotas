import os
import re

# Define the regular expression pattern to match citations in the bibliography section
citation_pattern = re.compile(r'<dt id="bibtex-([^"]+)"><span class="citation-label">\[\d+\]</span> </dt>')

# Function to inject back-reference links into the citations
def inject_backrefs(html_file):
    with open(html_file, 'r') as f:
        html_content = f.read()

    # Find all occurrences of citations in the bibliography section
    citations = citation_pattern.findall(html_content)

    # Inject back-reference links
    for citation_id in citations:
        backref_link = f'<a href="#bibtex-{citation_id}" class="citation-backref">↩</a>'
        html_content = html_content.replace(f'<dt id="bibtex-{citation_id}">', f'<dt id="bibtex-{citation_id}">{backref_link} ')

    with open(html_file, 'w') as f:
        f.write(html_content)

# Main function to process all HTML files in the directory
def main():
    for root, _, files in os.walk('_build/html'):
        for file in files:
            if file.endswith('.html'):
                html_file = os.path.join(root, file)
                inject_backrefs(html_file)

if __name__ == "__main__":
    main()
