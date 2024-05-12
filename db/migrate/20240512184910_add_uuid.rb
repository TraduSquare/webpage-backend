# frozen_string_literal: true

ROM::SQL.migration do
  change do
    alter_table(:articles) do
      add_column :uuid, :varchar, size: 40
    end
    alter_table(:projects) do
      add_column :uuid, :varchar, size: 40
    end
    alter_table(:groups) do
      add_column :uuid, :varchar, size: 40
    end
    alter_table(:missions) do
      add_column :uuid, :varchar, size: 40
    end
  end
end
