# Change these
set :repo_url,        'change_me'
set :user,            'webapp'
set :application,     'rails-template'

# Don't change these unless you know what you're doing
set :rbenv_ruby,      '2.5.7'
set :passenger_restart_with_touch, true
set :pty,             true
set :use_sudo,        false
set :stage,           :production
set :deploy_via,      :remote_cache
set :deploy_to,       "/home/webapp/webapp"
set :ssh_options,     { forward_agent: true, user: fetch(:user), keys: %w(~/.ssh/id_rsa.pub) }

## Linked Files & Directories (Default None):
set :linked_files, %w{.env.production config/data.yml}
set :linked_dirs,  %w{log tmp/pids tmp/cache tmp/sockets vendor/bundle uploads}

namespace :rbenv do
  desc 'Install rbenv version of project if missing on server'
  task :install_rbenv_if_missing do
    on release_roles(fetch(:rbenv_roles)) do
      unless test "[ -d #{fetch(:rbenv_ruby_dir)} ]"
        execute :rbenv, 'install', fetch(:rbenv_ruby)
        execute :rbenv, 'global', fetch(:rbenv_ruby)
        execute :gem, 'install bundler'
      end
    end
  end
  before :validate, :install_rbenv_if_missing
end

namespace :deploy do
  task :create_non_existant_linked_files do
    on release_roles(fetch(:rbenv_roles)) do
      fetch(:linked_files).each do |file|
        unless test "[ -f #{file} ]"
          execute :touch, shared_path.join(file)
        end
      end
    end
  end

  # cap pnpr_staging deploy:rake[db:seed]
  desc 'Execute rake task through capristrano'
  task :rake, :command do |tsk, args|
    on roles(:db) do
      within release_path do
        with rails_env: fetch(:rails_env) do
          execute :rake, args[:command]
        end
      end
    end
  end


  before 'check:linked_files', :create_non_existant_linked_files
  after  :finishing,    :compile_assets
  after  :finishing,    :cleanup
  after  :finishing,    :restart
end
