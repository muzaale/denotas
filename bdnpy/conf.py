# -- Project information -----------------------------------------------------

project = 'Nothin\''
copyright = '2022, Abimereki Muzaale'
author = 'Abimereki Muzaale'

# -- General configuration ---------------------------------------------------

extensions = ['sphinxcontrib.bibtex']

# If you have any templates, specify them here. Otherwise, this can be an empty list.
templates_path = ['_templates']

# This is usually 'index' which is the default master document.
master_doc = 'index'

# -- Bibtex configuration (for citations) ------------------------------------

bibtex_bibfiles = ['bibliography.bib']
bibtex_reference_style = 'numeric'
bibtex_default_style = 'numeric'  # default bibliography style. You can adjust as per your need.

bibtex_enable_backrefs = True
bibtex_use_latex = False
bibtex_encoding = 'utf-8'


# -- Options for HTML output -------------------------------------------------

# The theme you're using for Jupyter-Book. 'alabaster' is just a default.
# Jupyter-book uses a custom theme based on 'pydata_sphinx_theme', so if you're trying to 
# reproduce the exact look you might need to adjust this.
html_theme = 'alabaster'

# If you want to exclude any patterns or files from being built by Sphinx
exclude_patterns = ['pattern1/*', 'path/to/myfile.ipynb']

# The rest of your Sphinx-specific configurations can go here.
