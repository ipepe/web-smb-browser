namespace :db do
  task vacuum: :environment do
    ApplicationRecord.connection.execute('VACUUM ANALYZE')
  end
end
