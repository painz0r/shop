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

before_fork do |server, worker|

  defined?(ActiveRecord::Base) and
      ActiveRecord::Base.connection.disconnect!


  if File.exists?(old_pid) && server.pid != old_pid
    begin
      Process.kill("QUIT", File.read(old_pid).to_i)
    rescue Errno::ENOENT, Errno::ESRCH
      # someone else did our job for us
    end
  end
end

after_fork do |server, worker|

  defined?(ActiveRecord::Base) and
      ActiveRecord::Base.establish_connection
end