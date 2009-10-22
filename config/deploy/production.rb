set :application, "airsyndicate.com.au"

set :scm, 'git'
set :repository,  "git@github.com:Creagency/air-syndicate.git"
set :branch, 'master'

set :user, 'deployer'
set :rails_env, 'production'
set :use_sudo, false
default_run_options[:pty] = true

#
# SSH Setup
#
ssh_options[:port] = 29682
ssh_options[:paranoid] = false
ssh_options[:forward_agent] = true

set :deploy_to, "/www/rails_apps/#{application}"
set :deploy_via, :remote_cache

role :app, "74.53.44.194"
role :web, "74.53.44.194"
role :db,  "74.53.44.194", :primary => true

namespace :deploy do
  task :after_update_code do
    run "cd #{latest_release} && rake gems:build"
  end

  task :restart do
    run "touch #{deploy_to}/current/tmp/restart.txt"
  end

  task :after_restart do
    find_and_execute_task "deploy:cleanup"
  end

  task :after_symlink do
    run "cd #{release_path} && /usr/local/bin/whenever --update-crontab #{application}"
  end
end

task :invoke do
  run("cd #{latest_release}; RAILS_ENV=#{rails_env} rake #{ENV['TASK']}")
end

task :passenger_vhost do
  sudo "cp #{latest_release}/config/#{application}.conf /etc/httpd/passenger_vhosts/"
  sudo "/usr/sbin/apachectl graceful"
end