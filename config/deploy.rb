set :application, "katalog"
set :repository,  "git://github.com/luciano073/katalog.git"

set :scm, :git # You can set :scm explicitly or Capistrano will make an intelligent guess based on known version control directory names
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`
set :user, "vagrant"
set :deploy_to, "/home/vagrant/apps/#{application}"

role :web, "localhost"                          # Your HTTP server, Apache/etc
role :app, "localhost"                          # This may be the same as your `Web` server
role :db,  "localhost", :primary => true # This is where Rails migrations will run
# role :db,  "your slave db-server here"
# set :port, 22
set :keep_releases, 5
set :use_sudo, false
# if you want to clean up old releases on each deploy uncomment this:
# after "deploy:restart", "deploy:cleanup"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end

  desc "Cria link para database.yml"
  task :symlink_database_yml do
    run "rm #{release_path}/config/database.yml"
    run "ln -sfn #{shared_path}/config/database.yml #{release_path}/config/database.yml"
  end

  desc "Reload the database with seed data"
    task :seed do
    run "cd #{current_path}; bundle exec rake db:seed RAILS_ENV=production"
  end
end
# after "deploy:finalize_update", "deploy:symlink_database_yml"


namespace :carrierwave do
  task :cp_uploads do
    run "cp -ru #{current_path}/public/uploads #{shared_path}/" 
  end
  # before "deploy:update", "carrierwave:cp_uploads"

  task :symlink, roles: :app do
    # run "cp -ru #{current_path}/public/uploads #{shared_path}/"
    run "rm -rf #{release_path}/public/uploads"
    run "ln -nfs #{shared_path}/uploads/ #{release_path}/public/uploads"
  end
  after "deploy:finalize_update", "carrierwave:symlink"
end

