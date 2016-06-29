require_relative '../test_helper'

class TaskManagerTest < Minitest::Test
  include TestHelpers

  def test_create_task_functions
    assert_equal 0, task_manager.all.count

    task_manager.create(title: "eat dinner", description: "PHO!")

    assert_equal 1, task_manager.all.count

    task = task_manager.find(task_manager.all.count)

    assert_equal "eat dinner", task.title
    assert_equal "PHO!", task.description
  end

  def test_all_returns_all_tasks
    task_manager.create(title: "go to gym", description: "Do you even lift bro?")
    task_manager.create(title: "eat dinner", description: "PHO!")
    task_manager.create(title: "code your face off", description: "DO IT")

    assert_equal 3, task_manager.all.count
    assert_instance_of Task, task_manager.all[0]
  end

  def test_find_a_task
    task_manager.create(title: "go to gym", description: "Do you even lift bro?")
    task_manager.create(title: "eat dinner", description: "PHO!")
    task_manager.create(title: "code your face off", description: "DO IT")
    task1 = task_manager.find(1)
    task2 = task_manager.find(2)
    task3 = task_manager.find(3)

    assert_equal "go to gym", task1.title
    assert_equal "eat dinner", task2.title
    assert_equal "code your face off", task3.title
  end

  def test_update_a_task
    task_manager.create(title: "go to gym", description: "Do you even lift bro?")
    updated_task = {title: "don't go to gym", description: "eat ice cream instead"}
    task = task_manager.find(task_manager.all.count)

    assert_equal "go to gym", task.title

    task_manager.update(task_manager.all.count, updated_task)
    task = task_manager.find(task_manager.all.count)

    assert_equal "don't go to gym", task.title
    assert_equal 1, task.id
  end

  def test_destroy_a_task
    assert_equal 0, task_manager.all.count

    task_manager.create(title: "eat dinner", description: "PHO!")
    task_manager.create(title: "drink", description: "turing hurts my soul")

    assert_equal 2, task_manager.all.count

    task = task_manager.find(task_manager.all.count)
    task_manager.destroy(task.id)

    assert_equal 1, task_manager.all.count
  end
end
