class ReadOnlyViewModel < ApplicationRecord
  self.abstract_class = true

  def self.refresh_materialized_view
    connection.execute <<~SQL
      REFRESH MATERIALIZED VIEW #{table_name};
    SQL
  end

  def self.readonly
    true
  end

  def readonly?
    true
  end
end
