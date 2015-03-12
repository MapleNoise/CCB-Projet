class WelcomeController < ApplicationController
  
  layout :welcome_layout
  
  @layout = "back"
  
   def welcome_layout
    @layout
  end
  
  def index
    @layout = "application"
  end
  
 def indexBack 
   @layout = "back"
 end
end
