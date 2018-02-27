require './test/test_helper'
require './lib/timesheet'

class TimeheetTest < Minitest::Test

  def test_instantiation
    employee_id = '5'
    project_id = '7'
    date = '2015-01-01'
    minutes = '120'
    timesheet = Timesheet.new(employee_id, project_id, date, minutes)

    assert_instance_of Timesheet, timesheet
  end

  def test_attributes
    skip
    project = Project.new('123', 'Widget Maker', '2015-01-01', '2018-01-01')

    assert_equal 123, project.id
    assert project.id.class == Integer
    assert_equal 'Widget Maker', project.name
    assert_instance_of Date, project.start_date
    assert_instance_of Date, project.end_date
  end

end
