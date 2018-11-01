class AddSlugToProfiles < ActiveRecord::Migration[5.2]
  def change
  	add_column :profiles, :slug, :string
    add_index :profiles, :slug
  end
end
