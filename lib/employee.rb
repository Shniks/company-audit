class Employee
  attr_reader :id,
              :name,
              :role,
              :start_date,
              :end_date

  def initialize(employee_id, name, role, start_date, end_date)
    @id           = employee_id.to_i
    @name         = name
    @role         = role
    @start_date   = DateHandler.string_to_date(start_date)
    @end_date     = DateHandler.string_to_date(end_date)
  end
end
