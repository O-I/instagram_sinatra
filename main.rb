require 'pg'
require 'pry'
require 'rake'
require 'dotenv'
require 'instagram'
# require 'twitter'
# require 'activerecord'
require 'sinatra/activerecord'
require 'sinatra'
require 'sinatra/reloader' if development?
require_relative 'config/instagram'

Dotenv.load
set :database, { adapter: 'postgresql',
                 database: 'instatweet',
                 host: 'localhost' }

class TweeGrams < ActiveRecord::Base
  
end