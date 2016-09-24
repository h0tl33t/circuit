ActiveAdmin.register User do
  permit_params :name,
                :email,
                :password,
                :password_confirmation

  filter :name_or_email_cont, label: 'Search'

  index do
    column :email
    column :current_sign_in_at
    column :sign_in_count
    column :created_at

    actions
  end

  form do |f|
    inputs 'Details' do
      input :name
      input :email
      input :password
      input :password_confirmation
    end

    actions
  end

  controller do
    def show
      show! do |success, failure|
        success.html { redirect_to [:edit, resource] }
      end
    end
  end
end
