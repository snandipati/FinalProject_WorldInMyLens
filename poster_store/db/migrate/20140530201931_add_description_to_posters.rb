class AddDescriptionToPosters < ActiveRecord::Migration
  def change
    add_column :posters, :description, :text
  end
end
