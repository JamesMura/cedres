college = College.create! :name => 'College Of Engineering Design Art And Technology'
puts 'Deparment'
department = college.departments.create :name => 'Department of Electrical And Computer Engineering'
puts 'Electrical'
program = department.academic_programs.create :name => 'Electrical Engineering'
program2 = department.academic_programs.create :name => 'Telecommunications Engineering'
program3 = department.academic_programs.create :name => 'Computer Engineering'
