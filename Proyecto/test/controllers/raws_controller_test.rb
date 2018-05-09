require 'test_helper'

class RawsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @raw = raws(:one)
  end

  test "should get index" do
    get raws_url
    assert_response :success
  end

  test "should get new" do
    get new_raw_url
    assert_response :success
  end

  test "should create raw" do
    assert_difference('Raw.count') do
      post raws_url, params: { raw: { cost: @raw.cost, created_at: @raw.created_at, expired_at: @raw.expired_at, measure: @raw.measure, name: @raw.name, quantity: @raw.quantity, type: @raw.type, updated_at: @raw.updated_at } }
    end

    assert_redirected_to raw_url(Raw.last)
  end

  test "should show raw" do
    get raw_url(@raw)
    assert_response :success
  end

  test "should get edit" do
    get edit_raw_url(@raw)
    assert_response :success
  end

  test "should update raw" do
    patch raw_url(@raw), params: { raw: { cost: @raw.cost, created_at: @raw.created_at, expired_at: @raw.expired_at, measure: @raw.measure, name: @raw.name, quantity: @raw.quantity, type: @raw.type, updated_at: @raw.updated_at } }
    assert_redirected_to raw_url(@raw)
  end

  test "should destroy raw" do
    assert_difference('Raw.count', -1) do
      delete raw_url(@raw)
    end

    assert_redirected_to raws_url
  end
end
