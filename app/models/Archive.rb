require 'active_record'

class Archive < ActiveRecord::Base
  has_many :users
  has_many :orders
  has_many :products
end