require_relative 'app/models/patient'
require_relative 'app/models/room'
require_relative 'app/repositories/room_repository'
require_relative 'app/repositories/patient_repository'

colin = Patient.new(name: 'Colin')
kim = Patient.new(name: 'Kim')
saori = Patient.new(name: 'Saori')

luxury = Room.new(capacity: 2)
shared = Room.new(capacity: 20)

# luxury.add_patient(colin)
# luxury.add_patient(kim)
# p luxury.full?
# luxury.add_patient(saori)

# p luxury
# # p kim.room

# p luxury
# p colin
# puts "#{colin.name} is #{colin.cured? ? 'cured' : 'not cured'}"
# puts "Doctor gives medicine"

# colin.cure!
# puts "#{colin.name} is #{colin.cured? ? 'cured' : 'not cured'}"

csv_file_path = 'data/rooms.csv'
room_repo = RoomRepository.new(csv_file_path)

big = Room.new(capacity: 50)
room_repo.add(big)

csv_file_path = "data/patients.csv"
patient_repo = PatientRepository.new(csv_file_path, room_repo)

p patient_repo