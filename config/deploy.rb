require 'mina/bundler'
require 'mina/rails'
require 'mina/git'
require 'mina/rvm'
require 'mina/puma'
require 'mina/logs'
set :domain, '39.108.138.149'
set :user, 'root'
set :deploy_to, '/home/deploy/dc_forum/'
set :repository, 'https://github.com/dccmmtop/dc_forum.git'    # private repository
set :branch, 'master'
set :forward_agent, true
set :shared_dirs, ['log']
set :shared_files, ['config/database.yml', 'config/secrets.yml']
set :rvm_path, '/usr/local/rvm/scripts/rvm'
desc 'Set up environment.'
task :remote_environment do
  invoke :'rvm:use', 'ruby-2.3.3@rails5'
end
desc 'Prepare for deployment.'
task :setup do
  task :setup do
    ['log', 'config', 'public/upload', 'tmp/pids', 'tmp/sockets'].each do |dir|
      command %{mkdir -p "fetch(:deploy_to)/shared/#{dir}"}
      command %{chmod g+rx,u+rwx "fetch(:deploy_to)/shared/#{dir}"}
    end

    ['config/database.yml', 'config/secrets.yml', 'config/puma.rb'].each do |file|
      command %{touch "fetch(:deploy_to)/shared/#{file}"}
      comment %{Be sure to edit 'shared/#{file}'.}
    end
  end
end
desc 'Deploy current version to the server.'
task :deploy do
  deploy do
    invoke :'git:clone'
    invoke :'deploy:link_shared_paths'
    invoke :'bundle:install'
    invoke :'rails:db_migrate'
    invoke :'rails:assets_precompile'
    invoke :'deploy:cleanup'

    on :launch do
      invoke :'puma:start'
      invoke :'puma:phased_restart'
    end
  end
end
