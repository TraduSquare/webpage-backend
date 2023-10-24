# frozen_string_literal: true

ROM::SQL.migration do
  change do
    create_table :platforms do
      primary_key :id
      column :title, :text, null: false
      column :slug, :text, null: false
      column :image_url, :text, null: false
      column :created_at, DateTime
      column :updated_at, DateTime
    end
  end
end
