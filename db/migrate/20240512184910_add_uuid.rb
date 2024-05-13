# frozen_string_literal: true

ROM::SQL.migration do
  change do
    tables = %i[articles projects groups missions]

    tables.each do |x|
      alter_table(x) do
        add_column :uuid, :varchar, size: 40
      end
    end
  end
end
