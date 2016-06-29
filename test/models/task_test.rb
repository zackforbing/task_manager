require_relative '../test_helper'

class TaskTest < Minitest::Test

  def test_assigns_attributes_correctly
    task = Task.new({"id" => 11, "title" => "do the thing", "description" => "do it."})

    assert_equal 11, task.id
    assert_equal "do the thing", task.title
    assert_equal "do it.", task.description
  end
end
