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

### Deploy

    git push heroku master




