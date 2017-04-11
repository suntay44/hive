class SessionsController < ApplicationController
  skip_before_action :authorize
  
  def new
    
  end

  def create
  
    person = Person.find_by(person: params[:person])
    if person and person.authenticate(params[:password]) 
      if person.is_admin == true
      session[:person_id] = person.id
      redirect_to infos_url
    else
        session[:person_id] = person.id
      redirect_to infos_url
      
    end
          
    else
    
      redirect_to login_path, alert:"Invalid Username or Password"
    
    end
      
  end

  def destroy
    session[:person_id] = nil
    redirect_to login_url, alert:"successfully logout!"
  end
end
