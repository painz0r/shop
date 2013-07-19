# Production specific settings
if env == "production"
  # Help ensure your application will always spawn in the symlinked
  # "current" directory that Capistrano sets up.
  working_directory '/home/root/apps/shop/current'

  # feel free to point this anywhere accessible on the filesystem
  user 'root'
  shared_path = '/home/root/apps/shop/current'

  stderr_path '/home/root/apps/shop/current/log/unicorn.stderr.log'
  stdout_path '/home/root/apps/shop/current/log/unicorn.stdout.log'
end