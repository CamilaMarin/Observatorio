require 'test_helper'

class MapaControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

end
