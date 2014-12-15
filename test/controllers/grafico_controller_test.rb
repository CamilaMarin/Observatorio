require 'test_helper'

class GraficoControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

end
