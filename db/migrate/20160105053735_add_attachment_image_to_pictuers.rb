class AddAttachmentImageToPictuers < ActiveRecord::Migration
  def self.up
    change_table :pictuers do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :pictuers, :image
  end
end
