ActiveAdmin.register Question do
  MAX_CHOICE_COUNTS = 4

  permit_params :content, choices_attributes: [:id, :content, :is_correct, :_destroy]

  controller do
    def scoped_collection
      Question.includes(:choices)
    end
  end

  index do
    selectable_column
    id_column
    column :content

    column :choice do |t|
      table_for t.choices do
        column :content
        column :is_correct
      end
    end
    actions
  end

  show do |t|
    attributes_table do
      row :id
      row :content
      row :created_at
      row :updated_at
    end

    panel 'Choices' do
      attributes_table_for t.choices do
        row :content
        row :is_correct
      end
    end
  end

  form do |f|
    f.semantic_errors
    f.inputs do
      f.input :content
    end

    f.inputs do
      f.has_many :choices, allow_destroy: true do |t|
        t.input :content
        t.input :is_correct
      end
    end
    f.actions
  end
  
end
