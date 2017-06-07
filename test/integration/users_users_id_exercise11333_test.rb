require 'test_helper'

class UsersUsersIdExercise11333Test < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end

  def setup
    @user = users(:archer)
  end

  test "only activated users in index action" do
  	log_in_as(@user)
  	get users_path
  	assert_template 'users/index'
  	assert_select 'div.pagination'
  	users_index = User.paginate(page: 1)
  	users_index.each do |user|
  		if user.activated?
  			assert_select 'a[href=?]', user_path(user), text: user.name
  		end
  	end
  end

end
