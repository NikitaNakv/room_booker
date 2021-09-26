class ReportRenameTypeColumn < ActiveRecord::Migration[6.1]
  def self.up
    rename_column :reports, :type, :format
  end

  def self.down
    rename_column :reports, :format, :type
  end
end
