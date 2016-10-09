Rails.application.routes.draw do
  devise_for :users, ActiveAdmin::Devise.config

  ActiveAdmin.routes(self)

  # Re-order Routes
  get '/groups/:id/reorder', to: 'admin/groups#reorder', as: :reorder_root_group
end
