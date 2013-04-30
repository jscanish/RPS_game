require 'sinatra'
require 'shotgun'
require 'sass'



before do
    @defeat = {rock: :scissors, paper: :rock, scissors: :paper}
    @throws = [:rock, :scissors, :paper]
end

get('/styles.css'){ scss :styles }


get '/' do 
	erb :home
end


post '/home' do
    @player_throw = params[:throw].to_sym 

    if !@throws.include?(@player_throw)
    	halt 403, "You must throw one of the following: rock, paper, or scissors"
    end

    @computer_throw = @throws.sample
    erb :result
end


get '/results' do 
    erb :results
end

