module ApplicationHelper
  def nav_link(link_text, link_path, additional_classes)
    class_name = current_page?(link_path) ? 'active' : ''

    content_tag(:li, :class => (class_name + additional_classes)) do
      link_to link_text, link_path
    end
  end

  def title(page_title)
    content_for(:title) { page_title }
  end

  def progress_width(t)
    totalpoints = 0;
    Checkpoint.all.each do |m|
      totalpoints += m.points
    end
    teampoints = 0;
    t.checkpoints.each do |z|
      teampoints += z.points
    end
    width = teampoints*100/totalpoints
    return width
  end

  def team_points(t)
    teampoints = 0;
    t.checkpoints.each do |z|
      teampoints += z.points
    end
    return teampoints
  end


  def flash_class(level)
    case level
    when :notice then "alert-box"
    when :success then "alert-box success"
    when :error then "alert-box alert"
    when :alert then "alert-box alert"
    end
  end
end
