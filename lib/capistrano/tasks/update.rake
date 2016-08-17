namespace :update do
  task :pull do
    on roles(:app) do
      within '/srv/www/stcpress/shared/public/miscellaneous' do
          execute :git, 'pull'
      end 
    end
  end

  task :db do
    on roles(:app) do
      within release_path do
        with rails_env: fetch(:rails_env) do
          execute :rake, 'init_db:all'
        end
      end 
    end
    invoke 'puma:restart'
  end

  task :all => [:pull, :db]
  
end
