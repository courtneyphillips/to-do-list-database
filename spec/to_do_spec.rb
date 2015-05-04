require('rspec')
require('to_do')

DB = PG.connect({:dbname => 'to_do_test'})

RSpec.configure do |config|
  config.after(:each) do
    DB.exec("DELETE FROM tasks *;")
  end
end

describe(To_Do) do

  describe('#add') do
    it ("Create a task and save that Task (class To_Do) to a overall list of tasks.") do
      task1 = To_Do.new("Monday", "Wash the car.")
      task1.add()
      expect(To_Do.all).to(eq([task1]))
    end
  end

  describe('#description') do
    it('reads out the description for chosen task') do
      task1 = To_Do.new("Tuesday", "Wash the dog.")
      expect(task1.description()).to(eq(["Tuesday", "Wash the dog."]))
    end
  end

end
