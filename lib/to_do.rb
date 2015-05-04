#@@task_list = [["Monday","Wash the car."], ["Tuesday", "Wash the dog"]]
class To_Do
@@task_list = []

  attr_reader(:day, :task, :list_input)

  define_method(:initialize) do |inputs|
    @day = inputs.fetch(:day)
    @task = inputs.fetch(:task)
    @list_input = [@day, @task]
  end

  define_singleton_method(:all) do
    @@task_list
  end

  define_method(:add) do
    # new_task = new_task.push(@day).push(@task)
    @@task_list.push(self)
  end

  define_method(:description) do
    #  description = [self.day, self.task]
    @list_input
  end

  define_singleton_method(:clear) do
    @@task_list = []
  end

  define_method(:==) do |another_task|
    self.description == another_task.description
  end

end
