class CreateTweegrams < ActiveRecord::Migration
  def up
    create_table :tweegrams do |t|
      t.string :link
      t.timestamps
    end
  end

  def down
    drop_table :tweegrams
  end
end
