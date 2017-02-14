namespace :update do
  task :pull_misc do
    on roles(:app) do
      within '/srv/www/stcpress/shared/public/miscellaneous/include' do
          execute :git, 'pull'
      end 
      within '/srv/www/stcpress/shared/public/miscellaneous' do
          execute :git, 'pull'
      end 
    end
  end
  task :pull_bel do
    on roles(:app) do
      within '/srv/www/stcpress/shared/public/miscellaneous/include' do
          execute :git, 'pull'
      end 
      within '/srv/www/stcpress/shared/public/bel-accueil' do
          execute :git, 'pull'
      end 
    end
  end

  task :db do
    on roles(:app) do
      within release_path do
        with rails_env: fetch(:rails_env) do
          execute :rake, 'init_db:all'
          execute :rake, 'json:search'
        end
      end 
    end
    invoke 'puma:restart'
  end

  task :all => [:pull_misc, :pull_bel, :db]
end
