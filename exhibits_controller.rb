require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( './models/exhibit.rb' )
require_relative( './models/artist.rb' )
also_reload( './models/*' )

get '/admin/exhibit' do
  @exhibits = Exhibit.all()
  erb :"admin/exhibit/index", :layout => :admin_layout
end

get '/admin/exhibit/new' do
  @artists = Artist.all()
  erb :"admin/exhibit/new", :layout => :admin_layout
end

post '/admin/exhibit' do
  @exhibit = Exhibit.new(params)
  @exhibit.save()
  @exhibits = Exhibit.all()
  erb :"admin/exhibit/index", :layout => :admin_layout
end

get '/admin/exhibit/:id' do
  @exhibit = Exhibit.find(params['id'])
  erb :"admin/exhibit/show", :layout => :admin_layout
end

post '/admin/exhibit/:id/delete' do
  exhibit = Exhibit.find(params['id'])
  exhibit.delete
  @exhibits = Exhibit.all()
  erb :"admin/exhibit/index", :layout => :admin_layout
end

get '/admin/exhibit/:id/edit' do
  @exhibit = Exhibit.find(params['id'])
  @artists = Artist.all()
  erb :"admin/exhibit/edit", :layout => :admin_layout
end

post '/admin/exhibit/:id/edit' do
  @exhibit = Exhibit.new(params).update
  @exhibits = Exhibit.all()
  erb :"admin/exhibit/index", :layout => :admin_layout
end
