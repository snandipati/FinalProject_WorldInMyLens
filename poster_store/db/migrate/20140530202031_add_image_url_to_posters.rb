class AddImageUrlToPosters < ActiveRecord::Migration
  def change
    add_column :posters, :image_url, :string
  end
end
