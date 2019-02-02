require "application_system_test_case"

class CardstatesTest < ApplicationSystemTestCase
  setup do
    @cardstate = cardstates(:one)
  end

  test "visiting the index" do
    visit cardstates_url
    assert_selector "h1", text: "Cardstates"
  end

  test "creating a Cardstate" do
    visit cardstates_url
    click_on "New Cardstate"

    fill_in "Card", with: @cardstate.card_id
    fill_in "Delay", with: @cardstate.delay
    fill_in "Due", with: @cardstate.due
    fill_in "User", with: @cardstate.user_id
    click_on "Create Cardstate"

    assert_text "Cardstate was successfully created"
    click_on "Back"
  end

  test "updating a Cardstate" do
    visit cardstates_url
    click_on "Edit", match: :first

    fill_in "Card", with: @cardstate.card_id
    fill_in "Delay", with: @cardstate.delay
    fill_in "Due", with: @cardstate.due
    fill_in "User", with: @cardstate.user_id
    click_on "Update Cardstate"

    assert_text "Cardstate was successfully updated"
    click_on "Back"
  end

  test "destroying a Cardstate" do
    visit cardstates_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Cardstate was successfully destroyed"
  end
end
