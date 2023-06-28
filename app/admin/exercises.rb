ActiveAdmin.register Exercise do
  permit_params :name, :image, :instruction

  index do
    selectable_column
    id_column
    column :name
    column "Image" do |exercise|
      image_tag exercise.image.variant(:thumb)
    end
    column :created_at
    actions
  end

  filter :name
  filter :created_at

  form do |f|
    f.inputs do
      f.input :name
      f.input :image, as: :file
      f.input :instruction
    end
    f.actions
  end

  show do
    panel "Exercise" do
      attributes_table_for exercise do
        row :name
        row :instruction do |a|
          a.instruction.html_safe if a.instruction.present?
        end
        row 'Image' do |p|
          image_tag p.image.variant(:thumb)
        end
        row :created_at
      end
    end
  end
end
