class RenameEmployeesTable < ActiveRecord::Migration
  def change
    rename_table :employees, :production_team
  end
end
