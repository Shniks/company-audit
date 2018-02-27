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
      @employees << data
    end
    binding.pry
  end

end
