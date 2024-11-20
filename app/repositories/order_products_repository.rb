require 'active_record'
require_relative '../models/OrderProduct'

class OrderProductsRepository

  def self.associate(file_id, order_id, product_id)

    order_products = OrderProduct.find_by(order_id: order_id, product_id: product_id)
  
    if !order_products
      order_products = OrderProduct.create(
        archive_id: file_id, 
        order_id: order_id,
        product_id: product_id
      )
      return order_products
    end
  end
end