ActiveAdmin.register Group do
  permit_params :name,
                :slug,
                user_ids: []

  reorderable

  filter :name_cont, label: 'Search'
  filter :members
  filter :users

  index as: :reorderable_table do
    column :name do |group|
      link_to group, [:edit, group]
    end

    column :users do |group|
      if group.users.any?
        ul do
          group.users.each do |user|
            li link_to user, user
          end
        end
      end
    end
  end

  form do |f|
    inputs do
      input :name
      input :slug
      input :users, multiple: true
    end

    actions
  end

  controller do
    def show
      show! do |success, failure|
        success.html { redirect_to groups_path }
      end
    end

    def find_resource
      Group.find_by!(slug: params[:id])
    end
  end
end
