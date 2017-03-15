
require "byebug"

#1
#display a list of all 
#questions for a specific user
get '/users/:id/questions' do
	erb :"static/users_id_questions"
end

#2
#return an HTML form for creating a 
#new question belonging to a specific user
get '/users/:id/questions/new' do
	erb :"static/users_id_questions_new"
end

#3
#create a new question 
#belonging to a specific user
post '/users/:id/questions' do
	
	question = Question.new(question: params[:question], user_id: current_user.id)
	question.save

	redirect "/users/#{current_user.id}/questions"

end

#4
#display a specific question 
#belonging to a specific user
get '/users/:user_id/questions/:id' do 
	@question = Question.find_by_id(params[:id])
 	erb :"static/users_user_id_questions_id"
end

#5
#return an HTML form for editing an question 
#belonging to a specific user
get '/users/:user_id/questions/:id/edit' do
	@question = Question.find_by_id(params[:id])
	erb :"static/users_user_id_questions_id_edit"
end

#6
#update a specific question 
#belonging to a specific user
put '/questions/:id' do
	question = Question.find_by_id(params[:id])
	question.update(question: params[:question])

	redirect "/users/#{current_user.id}/questions"
end

#7
#delete a specific question
#belonging to a specific user
delete '/users/:user_id/questions/:id' do
	question = Question.find_by_id(params[:id])
	question.destroy

	redirect "users/#{current_user.id}/questions"
end