#config/initializers/redis.rb
require 'redis'
require 'redis/objects'
 
conf_file = File.join('config','redis.yml')

$redis = if File.exists?(conf_file)
  conf = YAML.load(File.read(conf_file))
  conf[Rails.env.to_s].blank? ? Redis.new : Redis.new(conf[Rails.env.to_s])
else
  Redis.new
end