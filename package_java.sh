#!/usr/bin/env bash

set -e
source "$HOME/.rvm/scripts/rvm"

# shared directory between VM and host
cd '/vagrant'

# passed in path of gem to be cross-compiled
cd $1

rvm use jruby

# ensure RubyGems 1.8.x (required by rake-compiler)
gem update --system 1.8.25

gem install bundler && bundle install

bundle exec rake java gem
