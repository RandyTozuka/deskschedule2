require 'test_helper'

class WorkschedulesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get workschedules_index_url
    assert_response :success
  end

end
