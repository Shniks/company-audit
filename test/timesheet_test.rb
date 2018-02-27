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
    employee_id = '5'
    project_id = '7'
    date = '2015-01-01'
    minutes = '120'
    timesheet = Timesheet.new(employee_id, project_id, date, minutes)

    assert timesheet.employee_id.class == Integer
    assert timesheet.project_id.class == Integer
    assert_equal 5, timesheet.employee_id
    assert_equal 7, timesheet.project_id
    assert_instance_of Date, timesheet.date
    assert timesheet.minutes.class == Integer
  end

end
