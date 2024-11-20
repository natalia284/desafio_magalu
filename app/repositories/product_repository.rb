require_relative '../models/Product'

class ProductRepository
  def self.find_or_create(file_id, product_id, order_id, value)
    
    product = Product.find_by(id: product_id)
    
    if !product
      product = Product.create( 
        archive_id: file_id, 
        order_id: order_id, 
        id: product_id, 
        value: value
      )
      return product
    end
  end

  def self.sum_total(order_id)
    
    total = Product.joins(:order_products)
    .where(order_products: { order_id: order_id.to_i })
    .sum(:value)
    total
  end
end