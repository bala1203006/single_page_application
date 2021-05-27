module QuestionsHelper
	
	#get names of the roles
	def get_role_details
		Role.pluck(:name, :id)
	end

	#get names of the mappings
	def get_mapping_details
		Mapping.pluck(:name, :id)		
	end
end
