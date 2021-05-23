require_relative 'hash-serializer'

class ServiceDefinition < HashSerializer
  attr_accessor :cache_ttl, :timeout, :output_encoding, :version, :name, :extra_config

  def initialize args
    @params = [:cache_ttl, :timeout, :output_encoding, :version, :name]
    @params.each do |param|
      self.send("#{param.to_s}=".to_sym, args[param])
    end
  end

  def extra_config
    @extra_config || {}
  end
end
