class PeopleController < ApplicationController
  
  def index
    @person =[
      'Kannan Maikeffi',
      'Richard Kavin',
      'Sri Prasanna',
      'Viji Mani',
      'Roshni Bhardwaj'
    ]
  end
  
  def show
    @person = params[:id]
  end
  
end
