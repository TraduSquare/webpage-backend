# frozen_string_literal: true

ROM::SQL.migration do
  change do
    create_table :articles do
      primary_key :id
      column :title, :text, null: false
      column :content, :text, null: false
      column :featured_image, :text, null: false
      column :created_at, DateTime
      column :updated_at, DateTime
    end
  end
end
