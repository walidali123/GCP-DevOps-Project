from flask import Flask  # Corrected the import
app = Flask(__name__)    # Correctly instantiating the Flask application

@app.route('/')
def hello_world():
    return 'Hello, Simple Flask application'

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)  # Optional for local testing

