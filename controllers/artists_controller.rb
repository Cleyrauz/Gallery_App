require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/artist.rb' )
also_reload( '../models/*' )

get '/admin/artist' do
  @artists = Artist.all()
  erb :"admin/artist/index", :layout => :admin_layout
end

get '/admin/artist/new' do
  erb :"admin/artist/new", :layout => :admin_layout
end

post '/admin/artist' do
  @artist = Artist.new(params)
  @artist.save()
  @artists = Artist.all()
  erb :"admin/artist/index", :layout => :admin_layout
end

get '/admin/artist/:id' do
  @artist = Artist.find(params['id'])
  erb :"admin/artist/show", :layout => :admin_layout
end

post '/admin/artist/:id/delete' do
  artist = Artist.find(params['id'])
  artist.delete
  @artists = Artist.all()
  erb :"admin/artist/index", :layout => :admin_layout
end

get '/admin/artist/:id/edit' do
  @artist = Artist.find(params['id'])
  erb :"admin/artist/edit", :layout => :admin_layout
end

post '/admin/artist/:id/edit' do
  @artist = Artist.new(params).update
  @artists = Artist.all()
  erb :"admin/artist/index", :layout => :admin_layout
end
