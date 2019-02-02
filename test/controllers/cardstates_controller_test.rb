require 'test_helper'

class CardstatesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @cardstate = cardstates(:one)
  end

  test "should get index" do
    get cardstates_url
    assert_response :success
  end

  test "should get new" do
    get new_cardstate_url
    assert_response :success
  end

  test "should create cardstate" do
    assert_difference('Cardstate.count') do
      post cardstates_url, params: { cardstate: { card_id: @cardstate.card_id, delay: @cardstate.delay, due: @cardstate.due, user_id: @cardstate.user_id } }
    end

    assert_redirected_to cardstate_url(Cardstate.last)
  end

  test "should show cardstate" do
    get cardstate_url(@cardstate)
    assert_response :success
  end

  test "should get edit" do
    get edit_cardstate_url(@cardstate)
    assert_response :success
  end

  test "should update cardstate" do
    patch cardstate_url(@cardstate), params: { cardstate: { card_id: @cardstate.card_id, delay: @cardstate.delay, due: @cardstate.due, user_id: @cardstate.user_id } }
    assert_redirected_to cardstate_url(@cardstate)
  end

  test "should destroy cardstate" do
    assert_difference('Cardstate.count', -1) do
      delete cardstate_url(@cardstate)
    end

    assert_redirected_to cardstates_url
  end
end
