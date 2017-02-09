source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'rails',          '~> 5.0.1'
gem 'pg',             '~> 0.18'
gem 'puma',           '~> 3.0'
gem 'sass-rails',     '~> 5.0'
gem 'uglifier',       '>= 1.3.0'
gem 'coffee-rails',   '~> 4.2'
gem 'jquery-rails'

gem 'twitter',        '~> 6.1.0'
gem 'slim',           '~> 3.0.7'
gem 'kaminari',       '~> 1.0.1'

gem 'delayed_job_active_record', '~> 4.1.1'
gem 'clockwork',      '~> 2.0.0'

group :development, :test do
  gem 'pry',                      '~> 0.10.4'
  gem 'pry-rails',                '~> 0.3.4'
  gem 'dotenv-rails',             '~> 2.2.0'
  gem 'rspec-rails',              '~> 3.5.2'
  gem 'factory_girl_rails',       '~> 4.8.0'
  gem 'shoulda-matchers',         '~> 3.1.1'
  gem 'timecop',                  '~> 0.8.1'
  gem 'rails-controller-testing', '~> 1.0.1'
end

group :development do
  gem 'listen',       '~> 3.0.5'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

ruby '2.2.2'
