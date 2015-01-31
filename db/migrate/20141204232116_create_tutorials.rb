class CreateTutorials < ActiveRecord::Migration
  def change
    create_table :tutorials do |t|
      t.string :title
      t.string :url
      t.text :description

      t.timestamps
    end
  end
end
