$:.unshift File.expand_path("./../lib", __FILE__)
require 'rubygems'
require 'sinatra'
require 'app'


require 'bundler'
Bundler.require

run IdeaBoxApp
