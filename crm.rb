# new crm file used only for web app crm
require_relative 'contact'
require 'sinatra'
# require "pry"


get '/' do
end


#
#    get '/' do
# erb (:index)
#    end

   get '/index' do
erb (:index)
   end


  get '/about_me' do
erb (:about_me)
    end

get '/contacts' do
@all_contacts = Contact.all
# p @all_contacts
 erb(:contacts)
end

get '/contacts/:id' do
  @contact = Contact.find(params[:id])
  if @contact
    erb(:display_contact)
  else
    raise Sinatra::NotFound
end
end


   after do
     ActiveRecord::Base.connection.close
   end
