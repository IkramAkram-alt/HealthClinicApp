require "test_helper"

class PatientsControllerTest < ActionDispatch::IntegrationTest
  test "should get upload" do
    get patients_upload_url
    assert_response :success
  end

  test "should get process" do
    get patients_process_url
    assert_response :success
  end
end
