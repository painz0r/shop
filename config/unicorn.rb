root = "/home/root/apps/shop/current"
working_directory root
pid "#{root}/tmp/pids/unicorn.pid"
stderr_path "#{root}/log/unicorn.log"
stdout_path "#{root}/log/unicorn.log"


listen "/tmp/unicorn.shop.sock"
worker_processes 2
timeout 30
preload_app true

before_exec do |server|
  ENV['BUNDLE_GEMFILE'] = "#{root}/Gemfile"
end


after_fork do |server, worker|

  defined?(ActiveRecord::Base) and
      ActiveRecord::Base.establish_connection
end