#rvm use 2.6.6
bundle install --without production
bundle exec rake db:migrate
bundle exec rake db:test:prepare
rake spec
rake cucumber
