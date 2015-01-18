class CreateTools < ActiveRecord::Migration
  def change
    create_table :tools do |t|
      t.string :title
      t.string :url
      t.string :description

      t.timestamps
    end
  end
end
