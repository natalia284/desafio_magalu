require 'active_record'
require_relative '../models/Archive'

class ArchiveRepository

  def self.create(hash)
    archive = Archive.create(
      archive_hash: hash
    )
    return archive
  end
  
end