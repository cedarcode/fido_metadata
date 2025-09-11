# frozen_string_literal: true

source "https://rubygems.org"

git_source(:github) { |repo_name| "https://github.com/#{repo_name}" }

# Specify your gem's dependencies in fido_metadata.gemspec
gemspec

if Gem::Version.new(RUBY_VERSION) >= Gem::Version.new("3.4.0")
  gem "rubocop", "~> 1.80", require: false
end

gem "appraisal", "~> 2.5"
