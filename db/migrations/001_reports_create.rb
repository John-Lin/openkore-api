require 'sequel'

Sequel.migration do
  change do
    create_table(:reports) do
      primary_key :id
      String :username, unique: true
      String :char_info, default: 'None'
      String :exp_report, default: 'None'
      String :items, default: 'None'
      DateTime :created_at
      DateTime :updated_at
    end
  end
end
