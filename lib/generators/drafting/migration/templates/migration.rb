class DraftingMigration < ActiveRecord::Migration
  def self.up
    create_table :drafts do |t|
      t.string :target_type, :null => false
      t.references :user, :null => false
      t.references :parent, :polymorphic => true, :index => true
      t.text :data, :limit => 16777215
      t.datetime :updated_at, :null => false
    end

    add_index :drafts, [:user_id, :target_type]
  end

  def self.down
    drop_table :drafts
  end
end