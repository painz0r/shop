root = "/home/root/apps/shop/current"
working_directory root
pid "#{root}/tmp/pids/unicorn.pid"
stderr_path "#{root}/log/unicorn.log"
stdout_path "#{root}/log/unicorn.log"

# change the YOUR_APP_NAME to your application name
listen "/tmp/unicorn.shop.sock"
worker_processes 2
timeout 30


