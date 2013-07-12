task :clear_expired_carts => :environment do
    sql = 'DELETE FROM carts WHERE updated_at < DATE_SUB(NOW(), INTERVAL 1 DAY);'
    ActiveRecord::Base.connection.execute(sql)
end