require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative('./artists_controller')
require_relative('./exhibits_controller')


get '/' do
  erb( :home )
end

get '/exhibits' do
  @exhibits = Exhibit.all()
  erb :"exhibits/index"
end

get '/artists' do
  @artists = Artist.all()
  erb :"artists/index"
end

get '/artists/:id' do
  @artist = Artist.find(params['id'])
  erb :"artists/show"
end

get '/exhibits/:id' do
  @exhibit = Exhibit.find(params['id'])
  erb :"exhibits/show"
end
