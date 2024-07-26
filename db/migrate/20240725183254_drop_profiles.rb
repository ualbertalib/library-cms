# frozen_string_literal: true

class DropProfiles < ActiveRecord::Migration[7.1]
  def up
    drop_table :profiles
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
