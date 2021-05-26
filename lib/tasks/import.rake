require 'csv'

desc "Import teams from csv file"
task :import => [:environment] do

CSV.foreach('db/mapping.csv', headers: true) do |row|
  Mapping.find_or_create_by(name: row[0])
end
CSV.foreach('db/role.csv', headers: true) do |row|
  Role.find_or_create_by(name: row[0])
end
CSV.foreach('db/questions.csv', headers: true) do |row|
	mapping_id = Mapping.find_by(name: row[1])&.id
	role_id = Role.find_by(name: row[2])&.id
	Question.create(body: row[0], role_id: role_id, mapping_id: mapping_id)
end


end