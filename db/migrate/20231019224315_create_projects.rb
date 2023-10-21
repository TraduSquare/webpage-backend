# frozen_string_literal: true

ROM::SQL.migration do
  change do
    create_table :projects do
      primary_key :id
      column :title, :text, null: false
      column :technical_info, :text
      column :description, :text
      column :team, :text
      column :download, :text
      column :additional_info, :text
      column :buy_link, :text
      column :created_at, DateTime
      column :updated_at, DateTime
    end
  end
end
