require 'sequel'

Sequel.migration do
  change do
    create_table(:reports) do
      primary_key :id
      String :username, unique: true
      String :char_info, default: 'Tm9uZQ=='
      String :exp_report, default: 'Tm9uZQ=='
      String :items, default: 'Tm9uZQ=='
      DateTime :created_at
      DateTime :updated_at
    end
  end
end
