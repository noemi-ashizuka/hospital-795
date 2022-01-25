require 'csv'

class RoomRepository
  def initialize(csv_file_path)
    @csv_file_path = csv_file_path
    @next_id = 1
    @rooms = []
    load_csv
  end

  def add(room)
    room.id = @next_id
    @next_id += 1
    @rooms << room
    # save_csv
  end

  private

  def load_csv
    CSV.foreach(@csv_file_path, headers: :first_row, header_converters: :symbol) do |attributes|
      attributes[:id] = attributes[:id].to_i
      attributes[:capacity] = attributes[:capacity].to_i
      @rooms << Room.new(attributes)
    end
    @next_id = @rooms.any? ? @rooms.last.id + 1 : @next_id
  end
end
