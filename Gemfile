source 'https://rubygems.org'

ruby '2.0.0'

gem 'rails', '4.0.0'
gem 'mysql2'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 4.0.0'
  gem 'coffee-rails', '~> 4.0.0'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  gem 'therubyracer', :platforms => :ruby

  gem 'uglifier'
end

#gem 'anjlab-bootstrap-rails', '~> 3.0.0.3', :require => 'bootstrap-rails'

gem 'jquery-rails'
gem 'rmagick', :require=>'RMagick'
gem 'paperclip'

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'debugger'

gem 'kaminari'

group :development, :test do
  gem 'pry-rails'
  gem 'pry-doc'
end

group :development do
  gem 'better_errors'
  gem 'binding_of_caller'
end

group :production do
  gem 'rails_12factor'
end
