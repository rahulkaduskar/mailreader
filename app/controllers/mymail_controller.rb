class MymailController < ApplicationController
  
  def create
    
  end

  def index
  	@mymails = Mymail.order("id desc").limit(20)


  end

end
