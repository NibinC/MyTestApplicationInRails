class CreatePages < ActiveRecord::Migration[6.0]
  def change
    create_table :pages do |t|
      t.integer "subject_id"
      t.string "name",:limit=>30
      t.integer "permalink"
      t.integer "position"
      t.boolean "visible" 
      t.index "position"
      t.index "name"
      t.timestamps
    end
  end
end
