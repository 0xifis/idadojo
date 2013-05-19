ActiveAdmin.register User do
  index do
    column :name
    column :school
    column :email
    column :handphone
    column :team
    default_actions
  end
end