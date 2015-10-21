require 'sinatra'

set :bind, '0.0.0.0'
set :port, 3000
set :count, 0
# Your code here!
get '/' do
  # Replace the contents of this method
  settings.count += 1
  "Count: #{settings.count}"

end
