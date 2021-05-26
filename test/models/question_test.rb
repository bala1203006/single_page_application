# require "test_helper"

# class QuestionTest < ActiveSupport::TestCase
#   test "should not save a question without body" do
#     question = Question.new
#     question.role_id = 1
#     question.mapping_id = 1
#     assert_not question.save, "should not the save question without a body"
#   end

#   test "should save a question with body" do
#   	role = Role.create(name: "Admin")
#   	mapping = Mapping.create(name: 'communication')
#     question = Question.new({"role_id"=>role.id, "mapping_id"=>mapping.id, "body"=>"readmade"})
#     assert question.save, "should save question with a body"
#   end

# end
