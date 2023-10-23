# frozen_string_literal: true

ROM::SQL.migration do
  change do
    create_table :groups do
      primary_key :id
      column :title, :text, null: false
      column :slug, :text, null: false
      column :description, :text
      column :logo, :text
      column :web_url, :text
      column :email, :text
      column :twitter_url, :text
      column :youtube_url, :text
      column :discord_url, :text
      column :created_at, DateTime
      column :updated_at, DateTime
    end
    create_join_table(project_id: :projects, group_id: :groups)
  end
end
