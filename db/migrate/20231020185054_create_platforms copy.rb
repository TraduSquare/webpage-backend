# frozen_string_literal: true

ROM::SQL.migration do
  change do
    create_join_table(project_id: :projects, article_id: :articles)
    create_join_table(project_id: :projects, platform_id: :platforms)
  end
end
