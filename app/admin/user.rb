ActiveAdmin.register User do
  permit_params :name,
                :email,
                :password,
                :password_confirmation,
                :role,
                :active

  filter :name_or_email_cont, label: 'Search'

  scope :active, default: true
  scope :leader
  scope :volunteer
  scope :inactive

  index do
    column :name
    column :email
    column :role
    column :active

    actions
  end

  form do |f|
    inputs 'Details' do
      input :name
      input :email
      input :password
      input :password_confirmation

      if current_user.leader?
        input :role, as: :select, collection: User::ROLES
        input :active
      end
    end

    actions
  end

  controller do
    before_action :strip_empty_password_parameters, only: :update
    before_action :sanitize_leader_only_attributes, only: [:create, :update]

    def show
      show! do |success, failure|
        success.html { redirect_to [:edit, resource] }
      end
    end

    private

    def find_resource
      User.find_by!(slug: params[:id])
    end

    def strip_empty_password_parameters
      if params[:user][:password].empty?
        params[:user].delete(:password)
        params[:user].delete(:password_confirmation)
      end
    end

    def sanitize_leader_only_attributes
      if current_user.volunteer?
        params[:user].delete(:role)
        params[:user].delete(:active)
      end
    end
  end
end
