require 'byebug'
#display a list of all users
get '/users' do
 @users = User.all
 erb :"static/user"
end

# return an HTML form for creating a new user
get '/users/new' do
  erb :"static/user_new"
end

# create a new user
post '/users' do
	user = User.new(params[:user])
	user.save
	if user.save
	 redirect '/'
	else
	 redirect '/user/new'
	end
end

#display a specific user
get '/users/:id' do

  erb :"static/user_id"

end

#return an HTML form for editing a photo
get '/users/:id/edit' do

 erb :"static/user_id_edit"

end

#update a specific user
put '/users/:id' do
	# byebug
	user = User.find_by_id(params[:id])
	password = user.password_digest
	user.update(email: params[:email], password: password)

	redirect "/users/#{params[:id]}"
end

#delete a specific user
delete '/users/:id' do
	user = User.find_by_id(params[:id])
	user.destroy
	
	redirect "/users"
end

#session signin
post '/signin' do
 	user = User.find_by(email: params[:user][:email])
 	if user && user.try(:authenticate, params[:user][:password])
 		session[:id] ||=user.id
 		redirect "/users/#{user.id}"
 	else
 		redirect '/'
 	end
end

#session logout
get '/logout' do

	session[:id] = nil
	redirect '/'

end