require 'csv'

	desc "Import teams from csv file"
	task :import => [:environment] do
	CSV.foreach('db/CSV_Data.csv', headers: true) do |row|
		mapping_id = Mapping.find_or_create_by(name: row["Mapping"])&.id
		role_id = Role.find_or_create_by(name: row["Role"])&.id
		Question.create(body: row["Question"], role_id: role_id, mapping_id: mapping_id)
	end


end