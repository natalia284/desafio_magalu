require 'active_record'

class Product < ActiveRecord::Base
  has_many :order_products
  has_many :order, through: :order_products
end