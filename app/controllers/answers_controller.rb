require 'byebug'
#1
#display a list of all 
#answers for a specific question
get '/questions/:id/answers' do
	question = Question.find_by_id(params[:id])
	@question_id = question.id
	erb :"static/questions_id_answers"
end

#2
#return an HTML form for creating a 
#new answer belonging to a specific question
get '/questions/:id/answers/new' do
	question = Question.find_by_id(params[:id])
	@question_id = question.id
	erb :"static/new_answer"
end

#3
#create a new answer 
#belonging to a specific question
post '/questions/:id/answers' do
	byebug
	question_id = params[:id]
	answer = Answer.new(answers: params[:answer], question_id: question_id, user_id: 7)
	answer.save
	
	redirect "/"
end

	# question = Question.new(question: params[:question], user_id: current_user.id)
	# question.save

	# redirect "/users/#{current_user.id}/questions"

#4
#display a specific answer 
#belonging to a specific question
get 'questions/question_id/answers/:id' do

end

#5
#return an HTML form for editing an answer
#belonging to a specific question
get 'questions/questions_id/answers/:id/edit' do

end

#6
#update a specific answer
#belonging to a specific question
patch '/answers/:id' do

end

#7
#delete a specific answer
#belonging to a specific question
delete 'questions/:question_id/answers/:id' do

end