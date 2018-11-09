ENV['GRPC_VERBOSITY']="DEBUG"
ENV['GRPC_TRACE']="http"

require 'gruf'
require_relative 'lib/health_services_pb'

client = Gruf::Client.new(
  service: GrpcBugDemo::Health,
  options: {hostname: 'localhost:80'}, # <- to see what should be returned, change it to localhost:9001
)


p 'correct response'
puts "\n\n\n\n\n"
client.call(:Check)
p 'everything ok'
puts "\n\n\n\n\n"

p "server error"
p 'Here it should be Gruf::Client::Errors::PermissionDenied error (mapped automatically from grpc-status) :/'
p 'But it\'s Gruf::Client::Errors::Unknown because of no grpc-status header :/'
puts "\n\n\n\n\n"
client.call(:CheckFailure)
