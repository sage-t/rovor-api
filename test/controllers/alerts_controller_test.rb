require 'test_helper'

class AlertsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @alert = alerts(:one)
  end

  test "should get index" do
    get alerts_url, as: :json
    assert_response :success
  end

  test "should create alert" do
    assert_difference('Alert.count') do
      post alerts_url, params: { alert: { auto_alert: @alert.auto_alert, email: @alert.email, end_airports: @alert.end_airports, inbound_end: @alert.inbound_end, inbound_start: @alert.inbound_start, name: @alert.name, outbound_end: @alert.outbound_end, outbound_start: @alert.outbound_start, price_limit: @alert.price_limit, start_airports: @alert.start_airports, state: @alert.state, trip_len_max: @alert.trip_len_max, trip_len_min: @alert.trip_len_min, user_id: @alert.user_id } }, as: :json
    end

    assert_response 201
  end

  test "should show alert" do
    get alert_url(@alert), as: :json
    assert_response :success
  end

  test "should update alert" do
    patch alert_url(@alert), params: { alert: { auto_alert: @alert.auto_alert, email: @alert.email, end_airports: @alert.end_airports, inbound_end: @alert.inbound_end, inbound_start: @alert.inbound_start, name: @alert.name, outbound_end: @alert.outbound_end, outbound_start: @alert.outbound_start, price_limit: @alert.price_limit, start_airports: @alert.start_airports, state: @alert.state, trip_len_max: @alert.trip_len_max, trip_len_min: @alert.trip_len_min, user_id: @alert.user_id } }, as: :json
    assert_response 200
  end

  test "should destroy alert" do
    assert_difference('Alert.count', -1) do
      delete alert_url(@alert), as: :json
    end

    assert_response 204
  end
end
