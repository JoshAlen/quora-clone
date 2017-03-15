class Answer < ActiveRecord::Base
	# This is Sinatra! Remember to create a migration!
	# validates :answer, presence: true
	# validates :question_id, presence: true
	# validates :user_id, presence: true
	belongs_to :user
	belongs_to :question
end
