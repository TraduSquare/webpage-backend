# frozen_string_literal: true

ROM::SQL.migration do
  change do
    create_join_table(project_id: :projects, article_id: :articles)
    create_join_table(project_id: :projects, platform_id: :platforms)
    create_join_table(project_id: :projects, image_id: :images)
    create_join_table(article_id: :articles, image_id: :images)
  end
end
