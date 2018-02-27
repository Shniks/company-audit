require './test/test_helper'
require './lib/company'

class CompanyTest < Minitest::Test
  def test_if_it_exists
    company = Company.new

    assert_instance_of Company, company
  end

  def test_if_array_are_initially_empty
    company = Company.new

    assert company.employees.empty?
    assert company.projects.empty?
    assert company.timesheets.empty?
  end

  def test_if_it_can_load_employees
    company = Company.new
    filename = './data/employees.csv'

    assert_equal ({success: true, error: nil}), company.load_employees(filename)
  end

  def test_if_it_gives_error_with_bad_employee_data
    company = Company.new
    filename = './data/bad_employees.csv'

    assert_equal ({success: false, error: 'bad data'}), company.load_employees(filename)
  end

  def test_if_it_can_load_projects
    company = Company.new
    filename = './data/projects.csv'

    assert_equal ({success: true, error: nil}), company.load_projects(filename)
  end

  def test_if_it_gives_error_with_bad_projects_data
    company = Company.new
    filename = './data/bad_projects.csv'

    assert_equal ({success: false, error: 'bad data'}), company.load_projects(filename)
  end

  def test_if_it_can_load_timesheets
    company = Company.new
    filename = './data/good_timesheets.csv'

    assert_equal ({success: true, error: nil}), company.load_timesheets(filename)
  end

  def test_if_it_gives_error_with_bad_timesheets_data
    company = Company.new
    filename = './data/bad_timesheets.csv'
  end

  def test_it_can_find_employee_by_id
    company = Company.new
    filename = './data/employees.csv'
    result = company.load_employees(filename)

    assert_instance_of Employee, company.find_employee_by_id(1)
    assert_equal "Susan Smith", company.find_employee_by_id(1).name
    assert_equal "Manager", company.find_employee_by_id(1).role
    assert_nil nil, company.find_employee_by_id(5)
  end

  def test_it_can_find_project_by_id
    company = Company.new
    filename = './data/projects.csv'
    result = company.load_projects(filename)

    assert_instance_of Project, company.find_project_by_id(1)
    assert_equal "Widgets", company.find_project_by_id(1).name
    assert_nil nil, company.find_project_by_id(5)
  end
end
