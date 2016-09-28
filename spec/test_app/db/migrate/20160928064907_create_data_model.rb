class CreateDataModel < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :email
      t.timestamps null: false
    end

    create_table :posts do |t|
      t.integer :user_id
      t.string  :title
      t.text    :body
      t.timestamps null: false
    end

    create_table :comments do |t|
      t.integer :post_id
      t.integer :user_id
      t.string  :message
      t.timestamps null: false
    end

    create_table :user_comments do |t|
      t.integer :user_id
      t.integer :comment_id
      t.integer :likes, default: 0
      t.timestamps null: false
    end
  end
end
