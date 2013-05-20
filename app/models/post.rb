class Post < ActiveRecord::Base
  attr_accessible :body, :important, :title
end
