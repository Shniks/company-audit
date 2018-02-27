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
      @employees << data if @status[:success] == true && @status[:error].nil?
    end
    @status
  end

  def returns(data, size)
    return_value = { success: true, error: nil }
    return_value[:error] = 'bad data' if data.length < size
    return_value[:success] = true if return_value[:error].nil?
    return_value
  end

end
