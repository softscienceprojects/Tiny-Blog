class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.string :title
      t.string :content
      t.belongs_to :user
      t.belongs_to :post

      t.timestamps
    end
  end
end
