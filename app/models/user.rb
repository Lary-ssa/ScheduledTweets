# email:string
# password_digest:string
#
# password:string virtual
# password_confirmation:string virtual

class User < ApplicationRecord
    has_secure_password 

    validates :email, presence: true, format: { with: /\A[^@\s]+@[^@\s]+\z/, message: "must be a valid email address" }
    def self.sync_all 
        client = Twitter::REST::Client.new do |config|
            config.consumer_key        = ENV["CONSUMER_KEY"]
            config.consumer_secret     = ENV["CONSUMER_SECRET"]
            config.access_token        = ENV["ACCESS_TOKEN"]
            config.access_token_secret = ENV["ACCESS_SECRET"]
        end
        messages=[]
        User.all.each do |user| 
            client.user_timeline(user.username).each do |user_timeline|
                messages << user_timeline.text
            end
        end
        messages
    end
    
end
