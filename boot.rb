require 'bundler/setup'
Bundler.require

require 'pathname'

lib_path = Pathname.new(File.expand_path('../lib', __FILE__))
autoload :Person, lib_path.join('person.rb')
