require('rspec')
require('to_do')
require('pg')

DB = PG.connect({:dbname => 'to_do_test'})

RSpec.configure do |config|
  config.after(:each) do
    DB.exec("DELETE FROM tasks *;")
  end
end

describe(To_Do) do

  describe('#add') do
    it("adds a task to the array of saved tasks") do
      test_task = To_Do.new({:task => "learn SQL"})
      test_task.add()
      expect(To_Do.all()).to(eq([test_task]))
    end
  end

  # describe('.all') do
  #   it("returns all data") do



  describe('#description') do
    it('reads out the description for chosen task') do
      task1 = To_Do.new({:task => "Wash the dog."})
      expect(task1.description()).to(eq("Wash the dog."))
    end
  end

  describe("#==") do
    it("is the same task if it has the same description") do
      task1 = To_Do.new({:task => "learn SQL"})
      task2 = To_Do.new({:task => "learn SQL"})
      expect(task1).to(eq(task2))
    end
  end
end
