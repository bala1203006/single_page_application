require "test_helper"

class RoleTest < ActiveSupport::TestCase
  test "should not save a role without name" do
    role = Role.new
    assert_not role.save, "should not save a role without name"
  end

  test "should save a role without name" do
    role = Role.new
    role.name = 'mapped'
    assert role.save, "should save a role without name"
  end
end

