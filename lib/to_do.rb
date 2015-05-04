#@@task_list = [["Monday","Wash the car."], ["Tuesday", "Wash the dog"]]
class To_Do
@@task_list = []

  attr_reader(:task)

  define_method(:initialize) do |inputs|
    @task = inputs.fetch(:task)
  end

  define_singleton_method(:all) do
    returned_tasks = DB.exec("SELECT * FROM tasks;")
    tasks = []
    returned_tasks.each() do |task|
      description = task.fetch("description")
      tasks.push(To_Do.new({:task => description}))
    end
    tasks
  end

  define_method(:add) do
     DB.exec("INSERT INTO tasks (description) VALUES ('#{@task}');")
  end

  define_method(:description) do
    #  description = [self.day, self.task]
    @task
  end

  define_singleton_method(:clear) do
    @@task_list = []
  end

  define_method(:==) do |another_task|
    self.description == another_task.description
  end

end
