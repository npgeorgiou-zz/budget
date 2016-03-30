require_relative 'dispatcher'
require_relative 'util/object'
require 'webrick'
require 'yaml'
require 'json'

port = YAML.load_file('config/config.yaml')['port']
puts 'Starting up server...'
server = WEBrick::HTTPServer.new(:Port => port, :DocumentRoot => File.dirname(__FILE__) + '/clients/web')


server.mount_proc '/api' do |req, res|
  puts req.body
  input = req.body.decode

  # Sent input to dispatcher
  output = Dispatcher.new.dispatch(input)
  res.body = output.encode
end

trap "INT" do server.shutdown end
server.start
puts "Started server, listening on port #{port}"
