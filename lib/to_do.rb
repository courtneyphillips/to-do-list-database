#@@task_list = [["Monday","Wash the car."], ["Tuesday", "Wash the dog"]]
class To_Do
@@task_list = []

  attr_reader(:task, :list_id)

  define_method(:initialize) do |inputs|
    @task = inputs.fetch(:task)
    @list_id = inputs.fetch(:list_id)
  end

  define_singleton_method(:all) do
    returned_tasks = DB.exec("SELECT * FROM tasks;")
    tasks = []
    returned_tasks.each() do |task|
      description = task.fetch("description")
      list_id = task.fetch("list_id").to_i
      tasks.push(To_Do.new({:task => description, :list_id => list_id}))
    end
    tasks
  end

  define_method(:add) do
     DB.exec("INSERT INTO tasks (description, list_id) VALUES ('#{@task}', #{@list_id});")
  end

  define_method(:description) do
    @task
  end

  define_method(:==) do |another_task|
    self.description == another_task.description
  end

end
