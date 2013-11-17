require 'pg'
require 'pry'
require 'pry'
require 'rake'
require 'dotenv'
require 'instagram'
# require 'twitter'
# require 'activerecord'
require 'sinatra/activerecord'
require 'sinatra'
require 'sinatra/reloader' if development?
require_relative './config/instagram'

Dotenv.load
set :database, { adapter: 'postgresql',
                 database: 'instatweet',
                 host: 'localhost' }

class TweeGrams < ActiveRecord::Base
end

Instagram.configure do |config|
  config.client_id = ENV['CLIENT_ID']
  config.client_secret = ENV['CLIENT_SECRET']
  config.access_token = ENV['ACCESS_TOKEN']
end 

get '/pics' do
  @pics = Instagram.media_popular
  binding.pry
  erb :popular_pics
end