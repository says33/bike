class AddS3AssetToProduct < ActiveRecord::Migration[5.0]
  def change
      add_reference :assets, :product, foreign_key: true
  end
end
