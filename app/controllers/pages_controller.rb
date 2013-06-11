class PagesController < ApplicationController
  before_filter :authenticate_user!, except: [:home, :contact]
  def home
    @posts = Post.order("created_at DESC").all
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
      flash[:error] = "That's an invalid code. Are you trying to scam us?"
      redirect_to pages_myteamprogress_path
    else
      t = current_user.team
      if t.checkpoints.where("checkpoint_id = ?", m.id).present?
        flash[:error] = "You have already submitted this code!"
        redirect_to pages_myteamprogress_path
      else
        t.checkpoint_ids = t.checkpoint_ids.push(m.id)
        flash[:success] = "That's a valid code! Well Done!"
        redirect_to pages_myteamprogress_path
      end
    end
  end

  def leaderboard
  end
end
