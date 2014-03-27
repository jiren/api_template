class ApiRpmStore

  TIME_TO_EXPIRE = 60 # 1 min

  class << self

    attr_accessor :redis_client

    def init(config = {})
      self.redis_client = Redis.new(:url => "redis://#{config['host']}:#{config['port']}/#{config['database']}")
    end

    def incr(key)
      val = redis_client.incr(key)
      redis_client.expire(key, TIME_TO_EXPIRE) if val == 1
      val
    end

    def threshold?(key, threshold_value = 0)
      self.incr(key) < (threshold_value + 1)
    end

    def get(key)
      redis_client.get(key)
    end

    def clear(key)
      redis_client.del(key.to_s)
    end

  end

end
