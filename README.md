# A Ridiculously Simple Python Flask app on Lagoon

The goal of this repo is simple: Run a simple flask app on Lagoon using a "productionish" approach to demo how a Python app would work on Lagoon.

## What is done
 - There is a cli container that does the "heavy lifting" of creating a Python venv and installing Flask
 - There is a gunicorn container that runs the flask app, binding to 0.0.0.0:8000
 - There is a nginx container with a Server and Location stanza to send http traffic to the gunicorn container
 - The above runs with `docker-compose up` and plays nicely with Pygmy for local development

## What is not done
 - This is only "productionish" and a lot is missing to make a production grade setup
 - The Flask app itself is insanely basic - the SECRET_KEY isn't even set
 - Incase the above is not clear, this is not a production grade setup, but is rather an indicator of how one might go about running a Flask app in Lagoon

## Work locally
 - Prerequisite: https://docs.lagoon.sh/using-lagoon-the-basics/local-development-environments/
 - This repo assumes Pygmy: https://github.com/pygmystack/pygmy
 - Once all setup, git clone this repo, and run `docker-compose up`

## Lagoon Demo
 - A live demo lives on Lagoon: TODO ADD URL 
