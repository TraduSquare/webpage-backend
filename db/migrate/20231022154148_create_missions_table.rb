# frozen_string_literal: true

ROM::SQL.migration do
  change do
    create_table :missions do
      primary_key :id
      column :title, :text, null: false
      column :slug, :text, null: false
      column :description, :text, null: false
      column :email, :text, null: false
      column :featured_image, :text, null: false
      column :created_at, DateTime
      column :updated_at, DateTime
      foreign_key :project_id, :projects, on_delete: :cascade
    end
  end
end
