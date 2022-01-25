class Room
  attr_reader :capacity
  attr_accessor :id

  class CapacityReachedError < Exception; end

  def initialize(attributes = {})
    @id = attributes[:id] # integer
    @capacity = attributes[:capacity] # integer
    @patients = [] # array of patient instances
  end

  def full?
    @patients.length >= @capacity
  end

  def add_patient(patient)
    unless full?
      patient.room = self
      @patients << patient
    else
      raise CapacityReachedError, "The room is full"
    end
  end
end
