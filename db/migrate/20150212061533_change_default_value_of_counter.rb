class ChangeDefaultValueOfCounter < ActiveRecord::Migration
  def change
    change_column :urls, :access_count, :integer, default: 0
  end
end
