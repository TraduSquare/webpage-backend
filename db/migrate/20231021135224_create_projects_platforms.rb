# frozen_string_literal: true

ROM::SQL.migration do
  change do
    create_table :articles_projects do
      foreign_key :article_id, :articles, on_delete: :cascade
      foreign_key :project_id, :projects, on_delete: :cascade
      primary_key [:article_id, :project_id]
      index [:project_id, :article_id]
    end
    create_table :platforms_projects do
      foreign_key :platform_id, :platforms, on_delete: :cascade
      foreign_key :project_id, :projects, on_delete: :cascade
      primary_key [:platform_id, :project_id]
      index [:project_id, :platform_id]
    end
    create_table :images_projects do
      foreign_key :image_id, :images, on_delete: :cascade
      foreign_key :project_id, :projects, on_delete: :cascade
      primary_key [:image_id, :project_id]
      index [:project_id, :image_id]
    end
    create_table :articles_images do
      foreign_key :article_id, :articles, on_delete: :cascade
      foreign_key :images_id, :images, on_delete: :cascade
      primary_key [:article_id, :images_id]
      index [:images_id, :article_id]
    end
  end
end
