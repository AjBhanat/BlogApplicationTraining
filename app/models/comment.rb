class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post
  has_many :sub_comments, class_name: "Comment", :foreign_key => "comment_id",:dependent => :destroy
  #belongs_to :commentable, polymorphic: true
  #has_many :sub_comments, as: :commentable, :dependent => true

  validates_length_of :description, maximum: 100
  validate :validate_bad_words, :save_word_count

  include WordCheck

  def validate_bad_words
    if check_bad_word(self.description)
      self.errors.add("Bad word presnet in description")
    end

  end

  def save_word_count
    self.word_count = Comment.count_words(self.description)
  end
end
