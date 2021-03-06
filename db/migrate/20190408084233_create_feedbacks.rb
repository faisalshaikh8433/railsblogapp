class CreateFeedbacks < ActiveRecord::Migration[5.2]
  def change
    create_table :feedbacks do |t|
      t.string :username
      t.text :body
      t.references :article, foreign_key: true

      t.timestamps
    end
  end
end
