require "test_helper"

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test 'should not save User without first_name' do
    e = User.new(last_name: 'Budukh')
    assert_not e.save, 'Saved the user without first_name'
  end

  test 'should not save User without last_name' do
    e = User.new(first_name: 'Yash')
    assert_not e.save, 'Saved the user without last_name'
  end

end
