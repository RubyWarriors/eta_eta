require 'jimson'

class ServiceHandler
  extend Jimson::Handler 

  def calculate_eta(a,b)
    rand(5..90).to_s # * 1.5
  end
end

server = Jimson::Server.new(ServiceHandler.new)
server.start # serve on http://0.0.0.0:8999/