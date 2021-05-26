module QuestionsHelper
	def get_role_details
		Role.pluck(:name, :id)
	end

	def get_mapping_details
		Mapping.pluck(:name, :id)		
	end
end
