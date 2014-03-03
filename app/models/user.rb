class User < ActiveRecord::Base

  DEFAULT_API_RPM =  10

  before_create do |doc|
    doc.api_key = User.generate_api_key
    doc.api_rpm = DEFAULT_API_RPM if doc.api_rpm == 0
  end

  def self.generate_api_key
    loop do
      token = SecureRandom.base64(20).tr('0+/=', 'cQrt')
      break token unless User.exists?(api_key: token)
    end
  end
  
end
