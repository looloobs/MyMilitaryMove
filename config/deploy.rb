# Your Applications "Name"
set :application, "MilitaryMoveIt"

# The URL to your applications repository
set :repository,  "git@github.com:looloobs/MyMilitaryMove.git"
set :scm, "git"
set :scm_verbose, true
set :git_enable_submodules, 1


# Uncomment this line if you're using SVN.  It makes deployments much faster
set :deploy_via, :remote_cache

# Require subversion to do an export instead of a checkout.
set :checkout, 'export'

# The user you are using to deploy with (This user should have SSH access to your server)
set :user, "deploy"

# We want to deploy everything under your user, and we don't want to use sudo
set :use_sudo, false

# Where to deploy your application to.
set :deploy_to, "/home/deploy/militarymoveit.com/"

# -------------------------------- Server Definitions --------------------------------
# Define the hostname of your server.  If you have multiple servers for multiple purposes, we can define those below as well.
set :server_name, "67.214.213.13"

# We're assuming you're using a single server for your site, but if you have a seperate asset server or database server, you can specify that here.
role :app, server_name
role :web, server_name
role :db,  server_name, :primary => true


# -------------------------------- Final Config --------------------------------
# This configuration option is helpful when using svn+ssh but doesn't hurt anything to leave it enabled always.
default_run_options[:pty] = true 

namespace :deploy do
  task :restart do
    run "touch #{deploy_to}current/tmp/restart.txt"
  end
  
  task :start do
    run "cd #{deploy_to} && ln -s current/public public_html"
    run "touch #{deploy_to}current/tmp/restart.txt"
  end
  
  task :symlink do
    run "cd #{deploy_to} && rm current ; ln -s releases/#{release_name} current"
    run <<-CMD
      rm -rf #{latest_release}/log #{latest_release}/public/system #{latest_release}/tmp/pids &&
      ln -s #{shared_path}/log #{latest_release}/log &&
      ln -s #{shared_path}/system #{latest_release}/public/system &&
      ln -s #{shared_path}/pids #{latest_release}/tmp/pids
      ln -s #{shared_path}/public/blog #{latest_release}/public/blog
    CMD
  end

  
  task :stop do
    run "rm #{deploy_to}public_html"
  end

  namespace :web do
    task :disable do
      run "cd #{deploy_to} && rm public_html && ln -s static_site public_html"
    end

    task :enable do
      run "cd #{deploy_to} && rm public_html && ln -s current/public public_html"
    end
  end

end

task :after_setup do
  run "rm -rf #{deploy_to}public_html"
  run "mkdir #{deploy_to}static_site"
  run "cd #{deploy_to} && ln -s static_site public_html"
end
