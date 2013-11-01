class User < ActiveRecord::Base


  attr_accessible :api_token, :last_name, :name
  has_many :tasks
  has_many :updates
end
