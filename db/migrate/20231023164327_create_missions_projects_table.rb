# frozen_string_literal: true

ROM::SQL.migration do
  change do
    create_join_table(project_id: :projects, mission_id: :missions)
  end
end
