require_relative '../lib/hash-serializer'

class Endpoint < HashSerializer
  attr_accessor :endpoint, :output_encoding, :method, :timeout, :headers_to_pass, :backend, :extra_config

  def initialize
    @params = [:endpoint, :output_encoding, :method, :timeout, :headers_to_pass, :backend, :extra_config]
  end
end
