class DropFriendlyIdSlugs < ActiveRecord::Migration[7.1]
  def up
    drop_table :friendly_id_slugs
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
