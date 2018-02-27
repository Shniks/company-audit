require './test/test_helper'
require './lib/project'

class ProjectTest < Minitest::Test

  def test_instantiation
    project_id = '123'
    name = 'Widget Maker'
    start_date = '2015-01-01'
    end_date = '2018-01-01'
    project = Project.new('123', 'Widget Maker', '2015-01-01', '2018-01-01')

    assert_instance_of Project, project
  end

  def test_attributes
    skip
    employee_id = '5'
    name = 'Sally Jackson'
    role = 'Engineer'
    start_date = '2015-01-01'
    end_date = '2018-01-01'
    employee = employee = Employee.new(employee_id, name, role, start_date, end_date)

    assert_equal 5, employee.id
    assert employee.id.class == Integer
    assert_equal 'Sally Jackson', employee.name
    assert_equal 'Engineer', employee.role
    assert_instance_of Date, employee.start_date
    assert_instance_of Date, employee.end_date
  end

end
