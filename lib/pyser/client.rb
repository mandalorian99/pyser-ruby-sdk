# require 'httparty'
module Pyser
  module Client
    
    def self.test
      puts "module loaded..."
    end
  
    def self.post(url: '', multipart: false, body: '', headers: {})
      result = HTTParty.post(url, multipart: multipart, body: body, headers: headers)
    rescue HTTParty::Error => e
      OpenStruct.new({ success?: false, error: e })
    else
      OpenStruct.new({ success?: true, payload: result })
    end
  
    def self.headers
      {
        'Content-Type' => 'multipart/form-data',
        'Authorization' => outgoing_mail_secret_key
      }
    end
  end
end

