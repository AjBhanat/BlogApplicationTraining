class Post < ApplicationRecord
  has_many :tags
  belongs_to :user
  has_many :comments, dependent: :destroy
  # Create a custom middleware to calculate response time of all requests
  #has_many :comments, as: commentable, :dependent => :destroy

  #Product.joins(:categories, :likes).where('categories.name= ?', 'animal')
  #Cataegory.joins(:products[:like]).uniq
  #Cataegory.joins(:products[:like], :products[:review]).uniq

  validates_presence_of :title, :body
  validates_length_of :title, maximum: 50
  validates_length_of :body, maximum: 200
  validates_inclusion_of :status, in: %w[draft published archive]

  #scope :draft, -> { where(:status => 'draft') }
  #scope :published, -> { where(:status => 'published') }

  include WordCheck

  validate :max_one_draft, :validate_bad_words, :save_word_count

  def max_one_draft
    if status == 'draft' && Post.where(user: self.user_id).count > 1
      self.errors.add("More than one post can't be saved as draft")
    end
  end

  def validate_bad_words
    if check_bad_word(self.title)
      self.errors.add("Bad word present in title")
    end

    if check_bad_word(self.body)
      self.errors.add("Bad word present in body")
    end
  end

  def save_word_count
    self.word_count = Post.count_words(self.body)
  end
end
