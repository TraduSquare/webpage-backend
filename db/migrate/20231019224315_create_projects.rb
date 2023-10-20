# frozen_string_literal: true

ROM::SQL.migration do
  change do
    create_table :projects do
      primary_key :id
      column :title, :text, null: false
      column :author, :text, null: false
    end
  end
end
