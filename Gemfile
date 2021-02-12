source 'https://rubygems.org'

ruby '2.5.7'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

gem 'bootsnap', require: false
gem 'rails', '< 5.1.0'

gem 'coffee-rails', '~> 4.2'
gem 'pg', '~> 0.18', '< 0.20.0'

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

# gem 'active_hash'
gem 'dotenv-rails'
# gem 'kaminari'
gem 'non-stupid-digest-assets'
# gem 'route_translator'
gem 'sidekiq'
gem 'slim-rails'
gem 'whenever', require: false

gem 'jquery-rails'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'

source 'https://rails-assets.org' do
  gem 'rails-assets-bootswatch-sass', '< 4.0.0'
  gem 'rails-assets-font-awesome', '< 5.0.0'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'bullet'
  gem 'listen', '~> 3.0.5'
  gem 'puma', '~> 3.0'
  gem 'rubocop'
  gem 'rubocop-performance'
  gem 'rubocop-rails'
  gem 'web-console', '>= 3.3.0'
end

group :development, :deploy do
  gem 'capistrano', require: false
  gem 'capistrano-bundler', require: false
  gem 'capistrano-passenger', require: false
  gem 'capistrano-rails', require: false
  gem 'capistrano-rbenv', require: false
end
