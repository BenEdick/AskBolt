require "test_helper"

class StateTest < ActiveSupport::TestCase

  def setup
    @state = State.new
  end

  def test_valid
    assert @state.valid?
  end

end
