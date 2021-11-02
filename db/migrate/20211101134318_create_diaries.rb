class CreateDiaries < ActiveRecord::Migration[6.1]
  def change
    create_table :diaries do |t|
      t.string :title
      t.string :feeling
      t.string :text

      t.timestamps
    end
  end
end
