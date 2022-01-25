class Patient
  attr_reader :name
  attr_accessor :room, :id

  def initialize(attributes = {})
    @id = attributes[:id]
    @name = attributes[:name] # string
    @room = attributes[:room] # instance!
    @cured = attributes[:cured] || false # boolean
  end

  def cured?
    @cured
  end

  def cure!
    @cured = true
  end
end
