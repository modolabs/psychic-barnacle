desc 'Output projects with corresponding items and completion state'

task output_project_todos: :environment do
  Project.includes(:items).each do |project|
    puts project.title

    project.items.each do |item|
      completion_status = item.done ? 'X' : ' '
      puts "- [#{completion_status}] #{item.action}"
    end

    puts "\n"
  end
end
