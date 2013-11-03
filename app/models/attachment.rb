# == Schema Information
#
# Table name: attachments
#
#  id                :integer          not null, primary key
#  download_path     :string(255)
#  file              :text
#  file_content_type :string(255)
#  file_file_name    :string(255)
#  file_file_size    :integer
#  is_previewable    :boolean
#  preview_path      :string(255)
#  task_id           :integer
#  type              :string(255)
#  uploader_id       :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

class Attachment < ActiveRecord::Base
  attr_accessible :download_path, :file, :file_content_type, :file_file_name, :file_file_size,
  		 :is_previewable, :preview_path, :task_id, :type, :uploader_id, :created_at, :updated_at, :id

  belongs_to :task
  belongs_to :uploader, :class_name => "User", :foreign_key => :uploader_id
  
end
