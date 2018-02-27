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

end