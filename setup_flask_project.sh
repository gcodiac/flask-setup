#!/bin/bash

# This script sets up a basic Flask application structure with necessary directories and files.

# Create directories
mkdir -p app/static/css app/static/images app/templates/includes

# Create files
touch app/static/css/main.css
touch app/static/images/.keep
touch app/templates/includes/footer.html app/templates/index.html
touch app/__init__.py app/routes.py config.py main.py

# Create .gitignore to ignore unnecessary files
echo -e ".venv/\n__pycache__/\n*.pyc\n*.pyo\n.env\n*.env" > .gitignore

# The following commands are related to setting up a Python environment using pyenv and virtualenv.
# These commands are commented out for the user to execute separately as needed.

# Install pyenv (if not already installed)
# curl https://pyenv.run | bash

# Load pyenv into the shell (uncomment these lines after installing pyenv)
# export PATH="$HOME/.pyenv/bin:$PATH"
# eval "$(pyenv init --path)"
# eval "$(pyenv init -)"
# eval "$(pyenv virtualenv-init -)"

# List all available pyenv versions
# pyenv versions

# Set local Python version (replace '3.12.3' with the desired version)
pyenv local 3.12.3

# Create a Python virtual environment in the project directory
python -m venv .venv

# Activate the virtual environment
source .venv/bin/activate

# Install Flask and python-dotenv inside the virtual environment
pip install Flask python-dotenv

# Create a basic Flask app in routes.py
cat <<EOL > app/routes.py
from app import app

@app.route('/')
def home():
    return "Hello, Flask!"
EOL

# Modify __init__.py to initialize the app and import routes
cat <<EOL > app/__init__.py
from flask import Flask
from dotenv import load_dotenv
import os

load_dotenv()

app = Flask(__name__)
app.config.from_object('app.config.Config')

from app import routes
EOL

# Create config.py for configuration settings
cat <<EOL > app/config.py
import os

class Config(object):
    SECRET_KEY = os.environ.get('SECRET_KEY') or "secret_string"
EOL

# Create main.py to run the Flask app
cat <<EOL > main.py
from app import app

if __name__ == '__main__':
    app.run()
EOL

# Create .flaskenv file to store environment variables
cat <<EOL > .flaskenv
FLASK_ENV=development
FLASK_APP=main.py
FLASK_DEBUG=1
EOL

# Generate requirements.txt
pip freeze > requirements.txt

# Print completion message
echo "Flask project setup is complete. You can now run your Flask application with the following command:"
echo "flask run"
