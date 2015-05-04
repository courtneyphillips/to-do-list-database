require 'spec_helper'

describe(To_Do) do

  describe('#add') do
    it("adds a task to the array of saved tasks") do
      test_task = To_Do.new({:task => "learn SQL", :list_id => 1})
      test_task.add()
      expect(To_Do.all()).to(eq([test_task]))
    end
  end

  describe("#list_id") do
    it("lets you read the list ID out") do
      test_task = To_Do.new({:task => "learn SQL", :list_id => 1})
      expect(test_task.list_id).to(eq(1))
    end
  end

  describe('#description') do
    it('reads out the description for chosen task') do
      task1 = To_Do.new({:task => "Wash the dog.", :list_id => 1})
      expect(task1.description()).to(eq("Wash the dog."))
    end
  end

  describe("#==") do
    it("is the same task if it has the same description") do
      task1 = To_Do.new({:task => "learn SQL", :list_id => 1})
      task2 = To_Do.new({:task => "learn SQL", :list_id => 2})
      expect(task1).to(eq(task2))
    end
  end
end
