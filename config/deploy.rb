# config valid for current version and patch releases of Capistrano
lock "~> 3.10.2"

set :application, "awesome_events"
set :repo_url, "https://github.com/takakag/awesome_events.git"

# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Default deploy_to directory is /var/www/my_app_name
set :deploy_to, "/var/www/awesome-events"
set :scm, :git

#set :git
# Default value for :format is :airbrussh.
# set :format, :airbrussh

# You can configure the Airbrussh format using :format_options.
# These are the defaults.
# set :format_options, command_output: true, log_file: "log/capistrano.log", color: :auto, truncate: :auto


# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
# append :linked_files, "config/database.yml"

# Default value for linked_dirs is []
# append :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets", "public/system"

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for local_user is ENV['USER']
# set :local_user, -> { `git config user.name`.chomp }

# Default value for keep_releases is 5
set :keep_releases, 5

#set :rbenv_type, :user
#set :rbenv_ruby, '2.5.0'
#set :rbenv_path, '~/.rbenv'
#set :rbenv_prefix, "RBENV_ROOT=#{fetch(:rbenv_path)} RBENV_VERSION=#{fetch(:rbenv_ruby)} #{fetch(:rbenv_path)}/bin/rbenv exec"

# 共有ディレクトリにSymlinkする対象を追加13yy
set :linked_dirs, fetch(:linked_dirs, ['tmp/pids'])

# Unicorn周りの設定をする
set :unicorn_rack_env, "none"
set :unicorn_config_path, 'config/unicorn.rb'

#after 'deploy:publishing', 'deploy:restart'
namespace :deploy do
  task :restart do
    invoke 'unicorn:restart'
  end
end

# Uncomment the following to require manually verifying the host key before first deploy.
# set :ssh_options, verify_host_key: :secure

#require 'capistrano-rbenv'
#set :rbenv_ruby_version, '2.5.0'

set :default_env, {
  rbenv_root: "/usr/local/rbenv",
  path: "/usr/local/rbenv/shims:/usr/local/rbenv/bin:$PATH"
}

#namespace :rbenv do
#  task :setup_shellenv do
#    set :default_env, {
#      'RBENV_ROOT' => "#{rbenv_path}",
#      'PATH' => "#{rbenv_path}/shims:#{rbenv_path}/bin:$PATH"
#    }
#  end
#  after 'multistage:ensure', 'rbenv:setup_shellenv'
#end
