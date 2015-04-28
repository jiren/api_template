require 'bundler/setup'
require 'httparty'

class ApiClient
  include HTTParty

  API_KEY = '4MhCZn3GuutUwN8U1ReeFwtt'

  base_uri 'http://localhost:3000'
  format :json
  headers 'Accept' => 'application/vnd.apitemplate.com.v1+json', 'X-Api-Key' => API_KEY

  def all
    self.class.get('/api/events')
  end

  def show(id)
    self.class.get("/api/events/#{id}")
  end

  def create(params)
    self.class.post('/api/events', { body: { event: params } } )
  end

end


puts ApiClient.new.all

# Event id : 1
puts ApiClient.new.show(1)

puts ApiClient.new.create(name: 'Test', occurred_at: Time.now)


