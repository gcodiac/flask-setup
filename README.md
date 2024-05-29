# Flask Project Setup

This repository contains the setup for a Flask application. The project includes a basic directory structure, a virtual environment, and necessary configurations to get started quickly with Flask.

## Project Structure

```plaintext
./
├── app/
│   ├── static/
│   │   ├── css/
│   │   │   └── main.css
│   │   └── images/
│   │       └── .keep
│   ├── templates/
│   │   ├── includes/
│   │   │   └── footer.html
│   │   └── index.html
│   ├── __init__.py
│   ├── routes.py
├── config.py
├── main.py
├── .flaskenv
├── .gitignore
├── requirements.txt
└── setup_flask_project.sh
```

## Setup Instructions

### Prerequisites

- Pyenv

### Installation

1. **Run the setup script:**

   ```sh
   # For scalable project: download the setup_flask_app.sh file and run: 
   chmod +x setup_flask_project.sh
   ./setup_flask_project.sh

   # For minimal project setup download and run: 
   chmod +x setup_minimal_flask.sh
   ./setup_flask_project.sh
   ```

<hr />

### Manual Setup

If you prefer to set up the project manually, follow these steps:

1. **Create directories:**

   ```sh
   mkdir -p app/static/css app/static/images app/templates/includes
   ```

2. **Create files:**

   ```sh
   touch app/static/css/main.css
   touch app/static/images/.keep
   touch app/templates/includes/footer.html app/templates/index.html
   touch app/__init__.py app/routes.py config.py main.py
   ```

3. **Create `.gitignore` to ignore unnecessary files:**

   ```sh
   echo -e ".venv/\n__pycache__/\n*.pyc\n*.pyo\n.env\n*.env" > .gitignore
   ```

4. **Set up Python virtual environment:**

   ```sh
   python3 -m venv .venv
   source .venv/bin/activate
   ```

5. **Install dependencies:**

   ```sh
   pip install Flask python-dotenv
   ```

6. **Create a basic Flask app in `routes.py`:**

   ```python
   from app import app

   @app.route('/')
   def home():
       return "Hello, Flask!"
   ```

7. **Modify `__init__.py` to initialize the app and import routes:**

   ```python
   from flask import Flask
   from dotenv import load_dotenv
   import os

   load_dotenv()

   app = Flask(__name__)
   app.config.from_object('app.config.Config')

   from app import routes
   ```

8. **Create `config.py` for configuration settings:**

   ```python
   import os

   class Config(object):
       SECRET_KEY = os.environ.get('SECRET_KEY') or "secret_string"
   ```

9. **Create `main.py` to run the Flask app:**

   ```python
   from app import app

   if __name__ == '__main__':
       app.run()
   ```

10. **Create `.flaskenv` file to store environment variables:**

    ```sh
    FLASK_ENV=development
    FLASK_APP=main.py
    FLASK_DEBUG=1
    ```

11. **Generate `requirements.txt`:**

    ```sh
    pip freeze > requirements.txt
    ```

### Running the Application

1. **Activate the virtual environment:**

   ```sh
   source .venv/bin/activate
   ```

2. **Run the Flask application:**

   ```sh
   flask run
   ```

The Flask development server should now be running at `http://127.0.0.1:5000/`.

## Contributing

Feel free to fork this repository and make your own changes. Pull requests are welcome!

## License

This project is licensed under the MIT License.