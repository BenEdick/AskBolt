require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new email: 'Testing@test.com'
  end

  def test_valid
    assert @user.valid?
  end

  def test_invalid_without_email
    @user.email = nil
    refute @user.valid?
  end
end
