@students = []

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  name = STDIN.gets.chomp
  while !name.empty? do
    add_to_students(name)
    puts "Now we have #{@students.count} students"
      name = STDIN.gets.chomp
  end
end

def add_to_students(name)
  @students << {name: name, cohort: :november}
end

def interactive_menu
  loop do
    print_menu
    options(STDIN.gets.chomp)
  end
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "4. Load the list of students from students.csv"
  puts "9. Exit"
end

def show_students
  print_header
  print_student_list
  print_footer
end

def options(selection)
  case selection
  when "1"
    input_students
  when "2"
    show_students
  when "3"
    puts "Enter filename"
    filename = gets.chomp
    if !filename.empty?
      save_students filename
    end
  when "4"
    puts "Enter filename"
    filename = gets.chomp
    if !filename.empty?
      load_students filename
    end
    puts "Data loaded"
  when "9"
    exit
  else
    puts "I don't know what you meant, try again"
  end
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print_student_list
  @students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer
  puts "Overall, we have #{@students.count} great students"
end

def save_students(filename)
  file = File.open(filename, "w")
  @students.each { |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  }
  file.close
end

def load_students(filename = "students.csv")
  if !File.exist? filename
      File.new filename, "w"
  end
  file = File.open(filename, "r")
  file.readlines.each { |line|
  name, cohort = line.chomp.split(',')
  add_to_students(name)
  }
  file.close
end

interactive_menu
