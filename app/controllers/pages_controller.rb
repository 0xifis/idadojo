class PagesController < ApplicationController
  before_filter :authenticate_user!, except: [:home, :contact]
  def home
  end

  def contact
  end
  
  def myteam

    @myteam = Team.find(current_user.team_id)
  end
end
