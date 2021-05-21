require_relative 'shared/hash-serializer'

class KrakendConfigBuilder < HashSerializer
  attr_accessor :service_definition, :endpoints, :extra_config

  def initialize(args)
    @service_definition = ServiceDefinition.new args

    @endpoints = []
    @extra_config = []
    @params = [:endpoints, :extra_config]
  end

  def build
    h = @service_definition.to_hash
    h = h.merge self.to_hash
    puts JSON.pretty_generate(h)
  end

end
