# frozen_string_literal: true

set :application, 'gatalogo_info'
set :repo_url, 'git@github.com:alexertech/gatalogo_info.git'
set :deploy_to, '/home/alex/gatalogo_info'
set :branch, 'main'

set :rbenv_ruby, File.read('.ruby-version').strip
set :rbenv_path, '$HOME/.rbenv/'
set :bundle_binstubs, nil
set :default_env, path: '~/.rbenv/shims:~/.rbenv/bin:$PATH'
set :default_environment, 'PATH' => '$HOME/.rbenv/shims:$HOME/.rbenv/bin:$PATH'

set :linked_files, %w[config/database.yml config/master.key config/credentials.yml.enc]
set :linked_dirs, %w[storage log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system]

set :nvm_type, :user # or :system, depends on your nvm setup
set :nvm_node, File.read('.nvmrc').strip
set :nvm_map_bins, %w[node npm yarn]

before 'deploy:assets:precompile', 'deploy:set_default_node_version'

namespace :deploy do
  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      execute :touch, release_path.join('tmp/restart.txt')
    end
  end

  after :publishing, 'deploy:restart'
  after :finishing, 'deploy:cleanup'
end
