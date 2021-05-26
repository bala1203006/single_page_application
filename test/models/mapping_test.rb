require "test_helper"

class MappingTest < ActiveSupport::TestCase
  test "should not save a mapping without name" do
    mapping = Mapping.new
    assert_not mapping.save, "should not save a mapping without name"
  end

  test "should save a mapping without name" do
    mapping = Mapping.new
    mapping.name = 'mapped'
    assert mapping.save, "should save a mapping without name"
  end  
end


