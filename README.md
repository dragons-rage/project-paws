# Project Paws

## Description

This is the source code for [onlypaws.fan].

## Requirements

- redis - Used for session/authentication data for in memory data
- MongoDB - Used to store documents, long term data

## Code

- app.py - The main app, run using uwsgi and nginx
- paws/* - directory should contain functions and classes for any extra.
- templates/* - Any file that needs parsing via jinja
- static/* - Any static files not needing parsing i.e. js, images, html
- backup.py - See ## Backup for more information
- Dockerfile - Used to build a container

## Backup

The app uses MongoDB so the backup script should backup the documents.
The backup will not only backup MongoDB, but also any user uploaded
content (images)
