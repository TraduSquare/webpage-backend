# frozen_string_literal: true

ROM::SQL.migration do
  change do
    create_table :groups do
      primary_key :id
      column :title, :text, null: false
      column :slug, :text, null: false
      column :description, :text, null: false
      column :logo, :text, null: false
      column :web_url, :text, null: false
      column :email, :text, null: false
      column :twitter_url, :text, null: false
      column :youtube_url, :text, null: false
      column :discord_url, :text, null: false
      column :created_at, DateTime
      column :updated_at, DateTime
    end
    create_join_table(project_id: :projects, group_id: :groups)
  end
end
