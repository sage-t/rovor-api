require 'test_helper'

class DealsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @deal = deals(:one)
  end

  test "should get index" do
    get deals_url, as: :json
    assert_response :success
  end

  test "should create deal" do
    assert_difference('Deal.count') do
      post deals_url, params: { deal: { alert_id: @deal.alert_id, end_airport: @deal.end_airport, inbound: @deal.inbound, link: @deal.link, outbound: @deal.outbound, price: @deal.price, start_airport: @deal.start_airport } }, as: :json
    end

    assert_response 201
  end

  test "should show deal" do
    get deal_url(@deal), as: :json
    assert_response :success
  end

  test "should update deal" do
    patch deal_url(@deal), params: { deal: { alert_id: @deal.alert_id, end_airport: @deal.end_airport, inbound: @deal.inbound, link: @deal.link, outbound: @deal.outbound, price: @deal.price, start_airport: @deal.start_airport } }, as: :json
    assert_response 200
  end

  test "should destroy deal" do
    assert_difference('Deal.count', -1) do
      delete deal_url(@deal), as: :json
    end

    assert_response 204
  end
end
