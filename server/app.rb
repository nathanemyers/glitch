#!/usr/bin/env ruby
require 'rubygems'
require 'bundler/setup'

require 'sinatra'
require 'json'

require 'random-word'
require_relative 'db'

DB_NAME = "glitch.db"

db = Database.new(DB_NAME)

set :public_folder, File.dirname(__FILE__) + '/static'

before do
  content_type :json
end

get '/random_glitch' do
  {foo: "hello"}.to_json
end


# RUNS

post '/runs' do 
  adj = RandomWord.adjs.next
  noun = RandomWord.nouns.next
  full_name = "#{adj}-#{noun}"
  db.create_run(full_name)

  { name: full_name }.to_json
end

get '/runs' do
  rows = db.get_runs()

  { runs: rows }.to_json
end

# ORDER

post 'order' do
  request.body.rewind  # in case someone already read it
  data = JSON.parse request.body.read
  "Hello #{data['name']}!"
end










