#!/bin/bash

if ! command -v python3 &> /dev/null
then
    echo "Python 3 not installed. Please install it."
    exit 1
fi

python3 -m venv venv

source venv/bin/activate

pip install --upgrade pip
pip install sphinx sphinxcontrib-mermaid sphinx-rtd-theme

python3 -m sphinx --version

sphinx-build -b html ./docs _build/html

echo "Installation Done ! type 'open _build/html/index.html' to view the documentation."
