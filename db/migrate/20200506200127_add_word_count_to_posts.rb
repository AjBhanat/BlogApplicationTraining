class AddWordCountToPosts < ActiveRecord::Migration[5.0]
  def change
    add_column :posts, :word_count, :integer
  end
end
