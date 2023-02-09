require "test_helper"

class RecruitsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @recruit = recruits(:one)
  end

  test "should get index" do
    get recruits_url
    assert_response :success
  end

  test "should get new" do
    get new_recruit_url
    assert_response :success
  end

  test "should create recruit" do
    assert_difference('Recruit.count') do
      post recruits_url, params: { recruit: { detail: @recruit.detail, money: @recruit.money, name: @recruit.name } }
    end

    assert_redirected_to recruit_url(Recruit.last)
  end

  test "should show recruit" do
    get recruit_url(@recruit)
    assert_response :success
  end

  test "should get edit" do
    get edit_recruit_url(@recruit)
    assert_response :success
  end

  test "should update recruit" do
    patch recruit_url(@recruit), params: { recruit: { detail: @recruit.detail, money: @recruit.money, name: @recruit.name } }
    assert_redirected_to recruit_url(@recruit)
  end

  test "should destroy recruit" do
    assert_difference('Recruit.count', -1) do
      delete recruit_url(@recruit)
    end

    assert_redirected_to recruits_url
  end
end
