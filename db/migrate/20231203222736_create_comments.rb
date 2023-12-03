# frozen_string_literal: true

ROM::SQL.migration do
  change do
    create_table :comments do
      primary_key :id
      column :body, :text, null: false
      column :user_id, :integer, null: false
      column :created_at, DateTime
      column :updated_at, DateTime
    end
    create_join_table(article_id: :articles, comment_id: :comments)
  end
end
