class CreateAttachments < ActiveRecord::Migration
  def change
    create_table :attachments do |t|
      t.string :download_path
      t.text :file
      t.string :file_content_type
      t.string :file_file_name
      t.integer :file_file_size
      t.boolean :is_previewable
      t.string :preview_path
      t.integer :task_id
      t.string :type
      t.integer :uploader_id

      t.timestamps
    end
  end
end
