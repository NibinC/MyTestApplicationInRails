class CreateSubjects < ActiveRecord::Migration[6.0]
  def up
    create_table :subjects do |t|
      t.string "name",:limit=>30,:default=>'name'
      t.integer "position"
      t.boolean "visible",:default=>true
      t.timestamps
      t.index "name"
      t.index "position",:unique=>true
    end
  end
  def down
  	drop_table :subjects
  end
end
