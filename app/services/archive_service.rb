require_relative '../repositories/archive_repository'
require_relative '../repositories/user_repository'
require_relative '../repositories/order_repository'
require_relative '../repositories/product_repository'
require_relative '../repositories/order_products_repository'

class ArchiveService

  def self.process_archive(archive)
    
    file_content = archive[:tempfile].read
    file_lines = file_content.split("\n")
    hash = self.generate_hash(file_content)
  
    file_hash = Archive.find_by(archive_hash: hash)
  
    if file_hash
      users = UserRepository.find_by_file_id(file_hash.id)
      return self.json_format(users)
    end
  
    created_archive = Archive.create(archive_hash: hash)
  
    file_lines.each do |line|
      user_id, username, order_id, date, product_id, ammount = self.slip_data(line)
  
      puts user_id, username, order_id, date, product_id, ammount
      UserRepository.find_or_create(user_id, username, created_archive.id)
      OrderRepository.find_or_create(created_archive.id, user_id, order_id, 0, date)
      ProductRepository.find_or_create(created_archive.id, product_id, order_id, ammount)

      OrderProductsRepository.associate(created_archive.id, order_id, product_id)

      total_update = ProductRepository.sum_total(order_id)
      OrderRepository.update_total(order_id, total_update)

    end
    
    users = UserRepository.find_by_file_id(created_archive.id)
    self.json_format(users)
  end
  

  def self.generate_hash(archive)
    Digest::MD5.hexdigest(archive)
  end

  def self.slip_data(line)
    user_id = line.slice(0, 10)
    username = line.slice(10, 45).strip
    order_id = line.slice(55, 10)
    date = line.slice(87, 8) 
    product_id = line.slice(65, 10)
    ammount = line.slice(75, 12)
  
    return [user_id, username, order_id, date, product_id, ammount]
  end
  
  def self.json_format(users)
    users_data = []
  
    users.each do |user|
      user_orders = user.orders.map do |order|
        {
          order_id: order.id,
          total: order.total,
          date: order.date,
          products: order.products.map do |product|
            {
              product_id: product.id,
              value: product.value
            }
          end
        }
      end
  
      users_data << {
        user_id: user.id,
        name: user.name,
        orders: user_orders
      }
    end
  
    users_data
  end
end  


  
