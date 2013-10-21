class User < ActiveRecord::Base
  attr_accessible :api_token, :last_name, :name
end
