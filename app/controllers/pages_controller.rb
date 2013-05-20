class PagesController < ApplicationController
  before_filter :authenticate_user!, except: [:home, :contact]
  def home
  end

  def contact
  end
  
  def myteam
    @myteam = current_user.team
  end
  
  def myteamprogress
    @myteam = current_user.team
    @totalpoints = 0;
    Checkpoint.all.each do |t|
      @totalpoints += t.points
    end
    @teampoints = 0;
    @myteam.checkpoints.each do |t|
      @teampoints += t.points
    end
    @width = @teampoints*100/@totalpoints
  end
  
  def checkpoints
    @checkpoints = Checkpoint.all
  end
  
  def checkcode
    m = Checkpoint.where("route = ?", params[:code]).first
    if m.nil?
      flash[:notice] = "That's an invalid code. Are you trying to scam us?"
      redirect_to root_path
    else
      t = current_user.team
      t.checkpoint_ids = t.checkpoint_ids.push(m.id)
      flash[:notice] = "That's a valid code! Well Done!"
      redirect_to pages_myteamprogress_path
    end
  end
  
  def leaderboard
  end
end
