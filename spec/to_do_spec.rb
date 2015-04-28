require('rspec')
require('to_do')

describe('String#to_do') do
  it ("Create a task and save that Task (class To_Do) to a overall list of tasks.") do
    task1 = To_Do.new("Monday", "Wash the car.")
    @@task_list.add(task1)
    expect(@@task_list).to(eq([["Monday", "Wash the car."]]))
  end
end
