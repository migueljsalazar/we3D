class AddObjectToProduct < ActiveRecord::Migration
  def self.up
    add_attachment :products, :object
  end

  def self.down
    remove_attachment :products, :object
  end
end
