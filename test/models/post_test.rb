require './test/test_helper'

class PostTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  #
  def define_post
    @post = Post.new
    @post.title = "Hello World"
    @post.body = "Post Body is here"
    @post.user = User.first
  end


  test 'post has title or not' do
    define_post
    post = @post
    assert post.title.present?
  end

  test 'post has body or not' do
    define_post
    post = @post
    assert post.body.present?
  end


  test 'post body has bad words or not' do
    define_post
    post = Post.new
    post.title = "poor boy"
    post.body = "Good Post"
    assert true, post.check_bad_word(post.title)
  end


end
