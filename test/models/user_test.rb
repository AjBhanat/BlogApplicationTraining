require './test/test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  #
  test 'create_user' do
    @user = User.new
    @user.email = "ajb@gmail.com"
    @user.password = "password"
    assert @user.save
  end
end
