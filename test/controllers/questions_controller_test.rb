require "test_helper"

class QuestionsControllerTest < ActionDispatch::IntegrationTest

  test "render index page for questions" do
	get '/'
    assert_response :success
    assert_not_nil assigns(:questions)
    assert_template :index
  end

  test "render new question form page for questions" do
	get '/questions/new', xhr: true
    assert_equal "text/javascript", @response.media_type
  end

  test "create new question" do
	  post questions_url, xhr: true, params: {"question"=>{"body"=>"asdasd", "role_id"=>"1", "mapping_id"=>"1"}}
    assert_response :success
    assert_equal "text/javascript", @response.media_type
  end

  test "show the question" do
  	@question = questions(:one)
  	get question_url(@question), xhr: true
    assert_response :success
    assert_equal "text/javascript", @response.media_type
  end

  test "edit the question should show the form" do
  	@question = questions(:one)
  	get edit_question_url(@question), xhr: true
    assert_response :success
    assert_equal "text/javascript", @response.media_type
  end

  test "update the question" do
    @question = questions(:one)
    post questions_url(@question), xhr: true, params: {"question"=>{"body"=>"asdasd", "role_id"=>"1", "mapping_id"=>"1"}}
    assert_response :success
    assert_equal "text/javascript", @response.media_type
  end

  test "destroy the question" do
  	@question = questions(:one)
  	assert_difference("Question.count", -1) do
      delete question_url(@question)
    end
    assert_redirected_to root_url
  end

end
