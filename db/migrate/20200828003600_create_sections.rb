class CreateSections < ActiveRecord::Migration[6.0]
  def change
    create_table :sections do |t|
      t.integer "page_id"
      t.string "name", :limit=>30
      t.integer "position"
      t.boolean "visible"
      t.string "content_type"
      t.text "content"
      t.timestamps
    end
  end
end
