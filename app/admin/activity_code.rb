ActiveAdmin.register ActivityCode do


  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # permit_params :list, :of, :attributes, :on, :model
  #
  # or
  #
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if resource.something?
  #   permitted
  # end
  permit_params :name, :code, :category_id

  index do
    selectable_column
    column :id, sortable: true
    column :code, sortable: true
    column :name, sortable: true
    column :category, sortable: true
    column :updated_at, sortable: true
    actions
  end

end
