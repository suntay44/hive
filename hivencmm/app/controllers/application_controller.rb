class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
    before_action :authorize
  
    helper_method :current_user
 
  def current_user
  
      
     @current_user ||= Person.find(session[:person_id])  if session[:person_id] 
    
    
    
   
  end

 


  
  protected
  
  def authorize
    
    unless current_user 
         
      redirect_to login_url, alert:"UNAUTHORIZE ACCESS!" 
    end
end


 
end
