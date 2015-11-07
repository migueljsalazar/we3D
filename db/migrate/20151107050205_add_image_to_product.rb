class AddImageToProduct < ActiveRecord::Migration
  def change
     def self.up
    add_attachment :product, :image
  end

  def self.down
    remove_attachment :product, :image
  end
  end
end
