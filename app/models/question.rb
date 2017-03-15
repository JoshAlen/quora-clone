class Question < ActiveRecord::Base
	# This is Sinatra! Remember to create a migration!
	validates :question, presence: true
	validates :user_id, presence: true
	belongs_to :user
	has_many :anwers
end
