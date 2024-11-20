require_relative '../models/Order'

class OrderRepository
  
  def self.find_or_create(file_id, user_id, order_id, total, date)
    
    order = Order.find_by(id: order_id)

    if !order
      order = Order.create(
        id: order_id,
        archive_id: file_id, 
        user_id: user_id, 
        total: 0, 
        date: date
      )
    end
    return order
  end

  def self.update_total(order_id, total)
    order = Order.find(order_id)
    order.update_column(:total, total)
  end
end