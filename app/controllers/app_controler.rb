require_relative '../services/archive_service'

require 'json'

class AppController < Sinatra::Base
  post '/upload' do
    file = params[:file]
    response = ArchiveService.process_archive(file)
    halt 400, { error: 'Nenhum arquivo foi enviado' }.to_json unless file
    
    content_type :json
    JSON.pretty_generate(response)
    
  end
end