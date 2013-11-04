# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  api_token       :string(255)
#  last_name       :string(255)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  remember_token  :string(255)
#  email           :string(255)
#  password_digest :string(255)
#  admin           :boolean          default(FALSE)
#  first_name      :string(255)
#  type            :string(255)
#

class User < ActiveRecord::Base
  attr_accessible :id, :api_token, :first_name, :last_name, :name, :password, :email, :password_confirmation, 
                  :created_at, :updated_at, :type

  has_many :created_tasks, :class_name => "Task", :foreign_key => :creator_id
  has_many :owned_tasks, :class_name => "Task", :foreign_key => :owner_id
  has_many :updates
  has_one :project_membership
  has_many :task_subscriptions
  has_many :comments
  has_many :task_events
  has_many :issues, :through => :owned_tasks
  has_many :tester_tests, :class_name => "KanbanTest", :foreign_key => :tester_id
  has_many :developer_tests, :class_name => "KanbanTest", :foreign_key => :tester_id
  has_many :attachments, :class_name => "Attachment", :foreign_key => :uploader_id
  has_many :created_issues, :class_name => "Issue", :foreign_key => :creator_id

  has_secure_password

  before_save { |user| user.email = email.downcase }
  before_save :create_remember_token

  validates :first_name, presence: true, length: { maximum: 50 }
  validates :last_name, presence: true, length: { maximum: 50 }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence:   true,
                    format:     { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 6 }
  validates :password_confirmation, presence: true
  validates :api_token, :token => true,
                        uniqueness: { case_sensitive: false }


    def full_name 
      self.first_name + " " + self.last_name
    end

    private

    def create_remember_token
      self.remember_token = SecureRandom.urlsafe_base64
    end
    
end
