class Timesheet

  attr_reader :employee_id,
              :project_id,
              :date,
              :minutes

  def initialize(employee_id, project_id, date, minutes)
    @employee_id  = employee_id.to_i
    @project_id   = project_id.to_i
    @date         = DateHandler.string_to_date(date)
    @minutes      = minutes.to_i
  end

end
