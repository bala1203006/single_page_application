class CreateQuestions < ActiveRecord::Migration[6.1]
  def change
    create_table :questions do |t|
      t.integer :role_id
      t.integer :mapping_id
      t.string :body

      t.timestamps
    end
  end
end
