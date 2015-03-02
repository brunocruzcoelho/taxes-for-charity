# Taxes for Charity

### Installation

    brew install rbenv
    rbenv install 2.1.5
    gem install bundler

Download [Postgres.app](http://postgresapp.com).

Configure your path, possibly in  `~/.bash_profile`:

	export PATH=$PATH:/Applications/Postgres.app/Contents/Versions/9.4/bin

Install the	pg gem:

    sudo ARCHFLAGS="-arch x86_64" gem install pg


And install remaining gems:

    bundle install

Create databases and users:

    CREATE ROLE tfc_development LOGIN ENCRYPTED PASSWORD 'tfc_development'
    CREATEDB REPLICATION
    VALID UNTIL 'infinity';

    CREATE DATABASE tfc_development
    WITH ENCODING='UTF8'
    OWNER=tfc_development
    CONNECTION LIMIT=-1;

    CREATE ROLE tfc_test LOGIN ENCRYPTED PASSWORD 'tfc_test'
    CREATEDB REPLICATION
    VALID UNTIL 'infinity';

    CREATE DATABASE tfc_test
    WITH ENCODING='UTF8'
    OWNER=tfc_test
    CONNECTION LIMIT=-1;

### Run

    ADMIN_KEY=xpto1234567890 bundle exec rails s

### Deploy

    git push heroku master




