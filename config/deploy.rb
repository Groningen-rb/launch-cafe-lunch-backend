require "bundler/capistrano"
#require "delayed/recipes"

set :user, 'deploy'
set :use_sudo, false
ssh_options[:keys] = [File.join(ENV["HOME"], ".ssh", "asimov_deploy")]

set :application, "launch-cafe-lunch"
set :rails_env, 'production'

server "asimov.serepo.com", :app, :web, :db, :primary => true
set :deploy_to,   "/home/deploy/apps/#{application}"

set :scm, :git
set :scm_verbose, false
set :git_enable_submodules, 0

set :deploy_via, :remote_cache

set :repository,  "https://github.com/Groningen-rb/launch-cafe-lunch-backend.git"
# set :branch, "production"

ssh_options[:forward_agent] = false

# set :default_environment, {
#   'RBENV_ROOT' => '/home/deploy/.rbenv',
#   'PATH' => "/home/deploy/.rbenv/shims:/home/deploy/.rbenv/bin:$PATH"
# }

# If you are using Passenger mod_rails uncomment this:
namespace :deploy do
  task :start do ; end
  task :stop do ; end

  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end

  desc "deploy and reset the database"
  task :reset do
    update
    migrate
    db.drop
    db.seed
    restart
  end

  desc "Symlink shared configs and folders on each release."
    task :symlink_shared do
      run "ln -nfs #{shared_path}/config/database.yml #{release_path}/config/database.yml"
  end
end

namespace :db do
  task :seed do
    run "cd #{current_path}; rake db:seed RAILS_ENV=#{rails_env}"
  end

  task :drop do
    run "cd #{current_path}; rake db:drop RAILS_ENV=#{rails_env}"
  end
end

before 'deploy:assets:precompile', 'deploy:symlink_shared'
