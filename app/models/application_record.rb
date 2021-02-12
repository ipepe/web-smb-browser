class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def self.pluck_to_hash(*keys)
    pluck(*keys).map { |pa| Hash[keys.zip(pa)] }
  end
end
