#!/usr/bin/env ruby

require 'bundler'
Bundler.require(:default)

SERVICE_HOST = ENV['SERVICE_HOST'] || 'localhost'
SERVICE_PORT = ENV['SERVICE_PORT'] || 8999

def json_rpc_connection
  conn = Jimson::Client.new("#{SERVICE_HOST}:#{SERVICE_PORT}") # the URL for the JSON-RPC 2.0 server to connect to
end    

get '/api', provides: [:json] do
  conn = json_rpc_connection
  lat = Float(params[:latitude])
  lng = Float(params[:longitude])
  result = conn.harvestine_distance(lat, lng) # call the 'sum' method on the RPC server and save the result '3'
  {eta: result}.to_json
end