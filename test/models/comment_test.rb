require './test/test_helper'

class CommentTest < ActiveSupport::TestCase

  def define_comment
    @comment = Comment.new
    @comment.description = "comment Body is here"
  end

  test 'comment has body or not' do
    define_comment
    comment = @comment
    assert comment.description.present?
  end



  test 'comment body validations' do
    define_comment
    comment = @comment
    assert comment.validate_bad_words
  end


end
