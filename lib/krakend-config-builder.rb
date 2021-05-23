require_relative 'hash-serializer'
require_relative 'config-plugins'
require_relative 'service-definition'

class KrakendConfigBuilder < HashSerializer
  attr_accessor :service_definition, :endpoints, :extra_config

  def initialize(args)
    @service_definition = ServiceDefinition.new args
    @params = [:endpoints, :extra_config]

    @params.each do |param|
      self.send("#{param.to_s}=".to_sym, args[param])
    end

    @endpoints ||= []
    @extra_config ||= []
  end

  def build
    h = @service_definition.to_hash
    h[:endpoints] = build_endpoints()
    h[:extra_config] = build_extra_config()
    h
  end

  private

  def build_extra_config
    get_plugins_by_type(@extra_config, :extraconfig)
      .inject({}) {|dict, plugin| dict = dict.merge plugin.build_for_service }
  end

  def build_endpoints
    get_plugins_by_type(@endpoints, :endpoint).map {|plugin| plugin.build() }
  end

  def get_plugins_by_type(elements, type)
    elements.map do |plugin_name|
      KrakendConfigPlugins.get(type, plugin_name)
    end.reject { |plugin| plugin.nil? }
  end

end
