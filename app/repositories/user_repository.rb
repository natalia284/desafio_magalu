require_relative '../models/User'

class UserRepository
  
  def self.find_or_create(user_id, username, file_id)
    
    user = User.find_by(id: user_id)

    if !user
      user = User.create(
        id: user_id, 
        name: username,  
        archive_id: file_id
      )
    end
    return user
  end

  def self.find_by_file_id(file_id)
     user = User.includes(orders: :products).where(archive_id: file_id)
     return user
  end
end