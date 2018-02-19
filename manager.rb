require_relative 'employee.rb'

class Manager < Employee
  def initialize(name, title, salary, boss, employees = [])
    super(name, title, salary, boss)
    @employees = employees
  end

  def bonus(multiplier)
    @bonus = total_salary_employees * multiplier
  end

  def total_salary_employees
    sum = 0
    @employees.each do |employee|
      sum += employee.salary
    end

    sum
  end
end

if __FILE__ == $PROGRAM_NAME
  shawna = Employee.new("Shawna", 'TA', 12000, nil)
  david = Employee.new("David", 'TA', 10000, nil)
  darren = Manager.new("Darren", 'TA Manager', 78000, nil, [shawna, david])
  ned = Manager.new("Ned", 'Founder', 1000000, nil, [shawna, david, darren])

  p ned.bonus(5) # => 500_000
  p darren.bonus(4) # => 88_000
  p david.bonus(3) # => 30_000

end
