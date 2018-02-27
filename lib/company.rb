require './modules/date_handler'
require './lib/employee'
require './lib/project'
require './lib/timesheet'
require 'time'
require 'csv'

class Company
  attr_reader :employees,
              :projects,
              :timesheets

  def initialize
    @employees  = []
    @projects   = []
    @timesheets = []
  end

  def load_employees(filename)
    CSV.foreach(filename, headers: false) do |data|
      @status = returns(data, 5)
      if @status[:success] == true && @status[:error].nil?
        @employees << Employee.new(data[0], data[1], data[2], data[3], data[4])
      else
        @error = true
      end
    end
    @status = {success: false, error: 'bad data'} if @error == true
    @status
  end

  def load_projects(filename)
    CSV.foreach(filename, headers: false) do |data|
      @status = returns(data, 4)
      if @status[:success] == true && @status[:error].nil?
        @projects << Project.new(data[0], data[1], data[2], data[3])
      else
        @error = true
      end
    end
    @status = {success: false, error: 'bad data'} if @error == true
    @status
  end

  def load_timesheets(filename)
    CSV.foreach(filename, headers: false) do |data|
      @status = returns(data, 4)
      if @status[:success] == true && @status[:error].nil?
        @timesheets << Timesheet.new(data[0], data[1], data[2], data[3])
      else
        @error = true
      end
    end
    @status = {success: false, error: 'bad data'} if @error == true
    @status
  end

  def returns(data, size)
    return_value = { success: true, error: nil }
    return_value[:error] = 'bad data' if data.length < size
    return_value[:success] = true if return_value[:error].nil?
    return_value
  end

  def find_employee_by_id(employee_id)
    employees.find { |employee| employee.id == employee_id.to_i }
  end

  def find_project_by_id(project_id)
    projects.find { |project| project.id == project_id.to_i }
  end
end
