#!/usr/bin/env python
# -*- coding: utf-8 -*-

from flask import Flask
app = Flask(__name__)
@app.route('/')
def hello_world():
    return 'Je suis riche, très riche, chuis dans l\'immobilier\n'
if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0')
