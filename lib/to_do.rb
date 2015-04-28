#@@task_list = [["Monday","Wash the car."], ["Tuesday", "Wash the dog"]]
class To_Do
@@task_list = []

  define_method(:initialize) do |day, task|
    @day = day
    @task = task
    @listinput = [day, task]
  end

  define_singleton_method(:all) do
    @@task_list
  end

  define_method(:add) do
    # new_task = new_task.push(@day).push(@task)
    @@task_list.push(self)
  end

  define_method(:description) do
    @listinput
  end

  define_singleton_method(:clear) do
    @@task_list = []
  end


end
