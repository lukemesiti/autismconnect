source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.0.2'

#ORIGINAL FOREM GEM for forum functionality
#gem 'forem', :github => "radar/forem", :branch => "rails4"

#Referring to Sam Peters' Repo 'cause she's awesome....
gem 'forem', '1.0.1.beta2', :github => "sammyjopeters/forem", :branch => "rails4"


#pagination gem --> originally to support forem but s'pose it could be used for more pagination too!
gem 'kaminari', '0.15.1'

#use cancan authentication gem because forem doesn't use PUNDIT yet dafaq?!
gem 'cancan', git: 'https://github.com/nukturnal/cancan.git'

# for authentication
gem 'devise'
gem 'omniauth-google-oauth2'

# needed to get client id and client secret
gem 'dotenv-rails', groups: [:development, :test]

group :production do
  gem 'rails_12factor' # for making heroku work
end

# authorization and role management
gem 'pundit'

# Use postgresql as the database for Active Record
gem 'pg'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.0'

# acts-as-taggable gem - to manage tags added to events, articles, links or documents:
gem 'acts-as-taggable-on'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 1.2'

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

#upload file gem 
gem 'carrierwave'

#bootstrap-sass
gem 'bootstrap-sass'

# geocoding
gem 'geocoder'

# google maps
gem 'gmaps4rails'

# Use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.1.2'

# Use unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]
