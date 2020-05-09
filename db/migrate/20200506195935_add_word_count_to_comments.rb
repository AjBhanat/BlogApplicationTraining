class AddWordCountToComments < ActiveRecord::Migration[5.0]
  def change
    add_column :comments, :word_count, :integer
  end
end
