require 'json'

require_relative 'lib/krakend-config-builder'
require_relative 'args/parser'

KrakendConfigPlugins.init()

$parser.parse!

builder = KrakendConfigBuilder.new($args)

if $args[:file_name]
  File.open($args[:file_name], "w") { |f| f.write JSON.pretty_generate(builder.build()) }
  puts "Contents written to `#{$args[:file_name]}`"
else
  puts JSON.pretty_generate(builder.build())
end
