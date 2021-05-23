require_relative '../lib/hash-serializer'

class Backend < HashSerializer
  attr_accessor :url_pattern, :host, :encoding, :sd, :method, :deny, :allow, :group, :mapping, :target, :is_collection, :extra_config

  def initialize
    @params = [:url_pattern, :host, :encoding, :sd, :method, :deny, :allow, :group, :mapping, :target, :is_collection, :extra_config]
  end
end
