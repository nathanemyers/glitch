#!/usr/bin/env ruby
#
require 'sinatra'
require_relative 'db'

DB_NAME = "glitch.db"

db = Database.new(DB_NAME)

get '/random_glitch' do

end
