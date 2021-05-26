class Question < ApplicationRecord
	validates :body, :role_id, :mapping_id, presence: true	
	belongs_to :role
	belongs_to :mapping
end
