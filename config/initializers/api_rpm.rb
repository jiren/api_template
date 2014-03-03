require 'api_rpm_store'

REDIS_CONFIG = YAML.load_file(Rails.root.join('config', 'redis.yml'))[Rails.env]

if defined?(PhusionPassenger)
  PhusionPassenger.on_event(:starting_worker_process) do |forked|
    if forked
      ApiRpmStore.init(REDIS_CONFIG)
    end
  end
else
  ApiRpmStore.init(REDIS_CONFIG)
end
