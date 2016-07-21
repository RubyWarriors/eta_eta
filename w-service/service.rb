require 'jimson'

class ServiceHandler
  extend Jimson::Handler 

  def harvestine_distance(a,b)
    rand(5..90).to_s
  end
end

server = Jimson::Server.new(ServiceHandler.new)
server.start # serve with webrick on http://0.0.0.0:8999/