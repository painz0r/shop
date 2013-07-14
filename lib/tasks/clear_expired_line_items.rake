task :clear_expired_line_items => :environment do
    sql = 'DELETE FROM line_items WHERE updated_at < DATE_SUB(NOW(), INTERVAL 1 DAY);'
    ActiveRecord::Base.connection.execute(sql)
end