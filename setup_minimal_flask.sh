#!/bin/bash

# This script sets up a minimal Flask application with necessary configurations.

# Create project directory
mkdir minimal_flask_app
cd minimal_flask_app || exit

# Create a Python virtual environment in the project directory
python3 -m venv .venv

# Activate the virtual environment
source .venv/bin/activate

# Install Flask and python-dotenv inside the virtual environment
pip install Flask python-dotenv

# Create a basic Flask app in app.py
cat <<EOL > app.py
from flask import Flask

app = Flask(__name__)

@app.route('/')
def home():
    return "Bismillah!"

if __name__ == '__main__':
    app.run()
EOL

# Create .flaskenv file to store environment variables
cat <<EOL > .flaskenv
FLASK_ENV=development
FLASK_APP=app.py
FLASK_DEBUG=1
EOL

# Generate requirements.txt
pip freeze > requirements.txt

# Create .gitignore to ignore unnecessary files
cat <<EOL > .gitignore
.venv/
__pycache__/
*.pyc
*.pyo
.env
*.env
EOL

# Print completion message
echo "Minimal Flask project setup is complete. You can now run your Flask application with the following commands:"
echo "cd minimal_flask_app "
echo "source .venv/bin/activate"
echo "flask run"

