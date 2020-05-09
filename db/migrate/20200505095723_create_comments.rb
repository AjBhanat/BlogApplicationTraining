class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.belongs_to :post, index: true
      t.belongs_to :user, index: true
      t.string :description
      t.references :sub_comment, index: true
      t.timestamps
    end
  end
end
