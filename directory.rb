def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  print "name: "
  @students = []
  name = gets.chomp
  while !name.empty?
    @students << {name: name, cohort: :november}
    puts "Now we have #{@students.count} students"
    name = gets.chomp
  end
  @students
end

def print_header
puts "The students of Villains Academy"
puts "-------------"
end
def mprint(students)
@students.each do |student, index|
    puts "#{index}. #{@student[:name]} (#{@student[:cohort]} cohort)"
  end
end
def print_footer(students)
  puts "Overall, we have #{@students.count} great students"
end

def interactive_menu
  @students = []
  loop do
    selection = gets.chomp
    case selection
    when "1"
      @students = input_students
    when "2"
    show_students
    when "9"
      exit
    else
      puts "I dont know what that meant, try again"
    end
  end
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "9. Exit"
end

def show_students
  print_header
  print(@students)
  print_footer(@students)
end
print_menu
interactive_menu
students = input_students
print_header
mprint(@students)
print_footer(@students)
