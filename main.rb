require 'pg'
require 'pry'
require 'pry'
require 'rake'
require 'dotenv'
require 'twitter'
require 'instagram'
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
  config.client_id     = ENV['CLIENT_ID']
  config.client_secret = ENV['CLIENT_SECRET']
  config.access_token  = ENV['ACCESS_COIN']
end

get '/pics' do
  @client = Twitter::REST::Client.new do |config|
    config.consumer_key        = ENV["CONSUMER_KEY"]
    config.consumer_secret     = ENV["CONSUMER_SECRET"]
    config.access_token        = ENV["ACCESS_TOKEN"]
    config.access_token_secret = ENV["ACCESS_SECRET"]
  end
  
  @pics = Instagram.media_popular
  # binding.pry
  erb :popular_pics
end