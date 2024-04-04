class EmployeeTaxData
  attr_accessor :ssn
  attr_accessor :salary
  def initialize(ssn, salary)
    @ssn = ssn
    @salary = salary
  end

  # ...
end

class Employee
  attr_accessor :name
  attr_accessor :email
  attr_accessor :tax_data

  def initialize(name, email)
    @name = name
    @email = email
  end

  def set_tax_data(ssn, salary)
    @tax_data = EmployeeTaxData.new(ssn, salary)
  end
  # ...
end

jack = Employee.new("Jack", "jack@gmail.com")
puts jack
puts jack.name
puts jack.email
puts jack.tax_data
#puts jack.tax_data.ssn
#puts jack.tax_data.salary
jack.set_tax_data("ssn", 2000)
puts jack.tax_data.ssn
puts jack.tax_data.salary
