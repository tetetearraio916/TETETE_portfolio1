class CreateAnswers < ActiveRecord::Migration[6.0]
  def change
    create_table :answers do |t|
      t.string :name
      t.text :content
      t.references :post, null: false, foreign_key: true

      t.timestamps
    end
    add_index :answers,[:post_id,:created_at]
  end
end
