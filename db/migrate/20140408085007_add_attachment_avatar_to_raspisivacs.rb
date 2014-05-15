class AddAttachmentAvatarToRaspisivacs < ActiveRecord::Migration
  def self.up
    change_table :raspisivacs do |t|
      t.attachment :avatar
    end
  end

  def self.down
    drop_attached_file :raspisivacs, :avatar
  end
end
