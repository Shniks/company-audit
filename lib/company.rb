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
      return(data, )
      @employees << data
    end
  end

  def return(data, size)
    return_value = { success: true, error: nil }
    data.each do |data|
      return_value[:error] = 'bad data' if data.length < size
    end
    return_value[:success] = true if return_value[:error] == nil
    return_value
  end

end
