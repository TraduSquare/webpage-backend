# frozen_string_literal: true

ROM::SQL.migration do
  change do
    create_table :images do
      primary_key :id
      column :original_filename, :text, null: false
      column :filesize, :text, null: false
      column :filetype, :text, null: false
      column :created_at, DateTime
      column :updated_at, DateTime
    end
  end
end
