require File.expand_path('../lib/block_changes', __FILE__)
require 'rake'
require 'jeweler'

Jeweler::Tasks.new do |gemspec|
  gemspec.name         = 'block_changes'
  gemspec.version      = BlockChanges::VERSION
  gemspec.platform     = Gem::Platform::RUBY
  gemspec.date         = Time.now.utc.strftime("%Y-%m-%d")
  gemspec.require_path = 'lib'
  gemspec.files        = `git ls-files`.split("\n")
  gemspec.extra_rdoc_files = ['LICENSE', 'README.md']
  gemspec.authors      = [ 'Kannan Manickam' ]
  gemspec.email        = [ 'arangamani.kannan@gmail.com' ]
  gemspec.homepage     = 'https://github.com/arangamani/block_changes'
  gemspec.summary      = 'Ruby Module for Detecting Variable Changes in a Block'
  gemspec.description  = %{
This is a simple Ruby module for detecting variable changes inside a block for improving code
with increased idempotency.}
  gemspec.test_files = `git ls-files -- {spec}/*`.split("\n")
  gemspec.rubygems_version = '1.8.17'
end
