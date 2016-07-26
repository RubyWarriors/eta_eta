#!/usr/bin/env ruby

require 'bundler'
Bundler.require(:default)

SERVICE_HOST = ENV['SERVICE_HOST'] || 'localhost'
SERVICE_PORT = ENV['SERVICE_PORT'] || 8999

def json_rpc_connection
  conn = Jimson::Client.new("#{SERVICE_HOST}:#{SERVICE_PORT}") # setup JSON-RPC 2.0 server connection
end    

get '/api/v1/eta', provides: [:json] do
  conn = json_rpc_connection
  lat = Float(params[:latitude])
  lng = Float(params[:longitude])
  result = conn.calculate_eta(lat, lng) # call the 'harvestine_distance' method on the RPC server
  {eta: result}.to_json
end