[ ![Codeship Status for kollegorna/badrumsbikten](https://codeship.com/projects/cd6f0060-f3de-0133-65b3-7686dce9455d/status?branch=master)](https://codeship.com/projects/149894)
[![Code Climate](https://codeclimate.com/repos/572c33ad5d6d1f007c005420/badges/6c85b7357fed98bd9d7d/gpa.svg)](https://codeclimate.com/repos/572c33ad5d6d1f007c005420/feed)

## Environments

#### Production:
https://badrumsbikten.herokuapp.com/

#### Staging:
Not available yet.

## Running locally

#### Prerequisites:
1. Ruby version stated in [.ruby-version](/.ruby-version) file.
2. Node LTS version 4.2.x

#### Setup:
1. ``git clone git@github.com:kollegorna/badrumsbikten.git``
2. ``bundle install``
3. ``npm install``
2. ``bin/rails s``

## Deploy to production

Master branch is being watched by Codeship. It will automatically
deploy the master branch to production if all the tests pass.

https://codeship.com/projects/149894

## Database

#### How to copy production data to your local database:

1. ``heroku pg:backups capture --app badrumsbikten``
2. ``curl -o latest.dump $(heroku pg:backups public-url --app vembi)``
3. ``pg_restore --verbose --clean --no-acl --no-owner -h localhost -d badrumsbikten_development latest.dump``
