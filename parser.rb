require 'optparse'
require_relative 'args-defaults'

$args = defaultArguments()

$parser = OptionParser.new do |opts|
  opts.banner = "Usage: #{$0} [options]"

  opts.on("-x", "--extra CONFIG-PLUGINS", Array, "Extra config plugin list") do |extraPlugins|
    $args[:extra] = extraPlugins
  end

  opts.on("-e", "--endpoints ENDPOINT-PLUGINS", Array, "Endpoint Plugin list") do |ids|
    $args[:dashboards] = ids
  end

  opts.on("-p", "--port PORT", String, "KrakenD listening port") do |port|
    $args[:port] = port
  end

  opts.on("-n", "--name SERVICE-NAME", String, "KrakenD instance name") do |service_name|
    $args[:name] = service_name
  end

  opts.on("-t", "--timeout DURATION", String, "Overall timeout duration") do |timeout|
    $args[:timeout] = timeout
  end

  opts.on("-c", "--cache-ttl TTL", String, "Cache time to live") do |cache_ttl|
    $args[:cache_ttl] = cache_ttl
  end

  opts.on("-o", "--output-encoding ENCODING", String, "Output encoding") do |output_encoding|
    $args[:output_encoding] = output_encoding
  end

  opts.on("-h","--help", "shows help message") do
    puts opts
    exit 1
  end
end
