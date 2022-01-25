require 'csv'

class PatientRepository
  def initialize(csv_file_path, room_repository)
    @csv_file_path = csv_file_path
    @room_repository = room_repository
    @next_id = 1
    @patients = []
    load_csv
  end

  def add(patient)
    patient.id = @next_id
    @next_id += 1
    @patients << patient
    # save_csv
  end

  private

  def load_csv
    CSV.foreach(@csv_file_path, headers: :first_row, header_converters: :symbol) do |attributes|
      attributes[:id] = attributes[:id].to_i
                            # "false"        == 'true' => false
                            # "true"         == 'true' => true
      attributes[:cured] = attributes[:cured] == 'true' 
      # room_id => I want a room instance
      # room_id = attributes[:room_id].to_i
      # attributes[:room] = @room_repository.find(room_id) # we get back an instance of room from the room repository
      @patients << Patient.new(attributes)
    end
    @next_id = @patients.any? ? @patients.last.id + 1 : @next_id
  end
end