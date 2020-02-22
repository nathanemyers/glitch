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

post '/runs' do 
  adj = RandomWord.adjs.next
  noun = RandomWord.nouns.next
  rows = db.create_run("#{adj}-#{noun}")

  { foo: rows }.to_json
end
