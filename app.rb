require 'sinatra'

set :bind, '0.0.0.0'
set :port, 3000

enable :sessions

get '/' do
  name = session[:name]
  unless name # send welcome screen if user not identified
    erb :default
  else # go to count screen
    puts "already have name: #{name}"
    redirect "/person/#{name}"
  end
end

## Submit form
post '/' do
  name = params[:name]
  unless name == "" # submit unless name not entered
    session[:name] = name
    puts "submitting form with name: #{name}"
    redirect "/person/#{name}"
  else
    puts 'name required (should validate this)'
    redirect "/"
  end
end

## check here first
get '/*' do
  pass if session[:name] # match a route below if the user's name has been captured
  redirect "/"
end

##
get '/person/:name' do
  name = session[:name]
  if name && name != ""
    session[:count] ||= 0
    session[:count] += 1
    wrongName = false
    if params[:name] != name
       wrongName = true
    end
    erb :index, :locals => {
      :name => name,
      :wrongName => wrongName,
      :title => "#{name}'s Sinatra Counter",
      :count => session[:count],
    }
  else
    redirect "/"
  end
end

## There's no reason to go here
get '/person/*/*' do
  redirect '/'
end

## Will match if no name has been supplied
get '/person/*' do
  if session[:name]
    erb :anonymous
  else
    redirect '/'
  end
end

## Information route
get '/info' do
  erb :info, :locals => {
    :name => session[:name],
  }
end

## forget the user (clear session)
get '/forget' do
  session.clear
  redirect "/"
end

## resource not found
not_found do
  erb :oops
end

after do
  puts "response: #{response.status}"
  puts "session: #{session.inspect}"
end
