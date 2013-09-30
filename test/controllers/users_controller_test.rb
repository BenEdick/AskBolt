require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  def test_new
    get :new
    assert_response :success
    assert_select 'form'
  end

  def test_create
    assert_difference 'User.count' do
      post :create, user: {email: 'testing@test.com'}
    end
    assert_redirected_to users_url
    assert_equal 'User Created!', flash[:notice]
  end

  def test_create_fail
    assert_no_difference 'User.count' do
      post :create, user: {email: ''}
    end
    assert_template 'new'
  end

  def test_index
    get :index
    assert_response :success
  end


  def test_update
    get :update
    assert_response :success
  end

  def test_edit
    get :edit
    assert_response :success
  end


end
