class AddDokumentToKonkurs < ActiveRecord::Migration
  def self.up
    add_attachment :konkursi, :dokument
  end

  def self.down
    remove_attachment :konkursi, :dokument
  end
end
