# frozen_string_literal: true

ROM::SQL.migration do
  change do
    create_table :missions do
      primary_key :id
      column :title, :text, null: false
      column :description, :text, null: false
      column :email, :text, null: false
      column :featured_image, :text, null: false
      column :created_at, DateTime
      column :updated_at, DateTime
    end
    create_join_table(project_id: :projects, mission_id: :missions)
  end
end
