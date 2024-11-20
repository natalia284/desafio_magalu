require 'sinatra'
require 'sinatra/activerecord'
require "./app/controllers/app_controler.rb"

set :database_file, 'config/database.yml'

use AppController
