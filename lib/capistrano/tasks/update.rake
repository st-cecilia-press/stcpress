namespace :update do
  task :pull_misc do
    on roles(:app) do
      within '/srv/www/stcpress/shared/public/stcpress-data' do
          execute :git, 'pull'
      end 
      within '/srv/www/stcpress/shared/public/miscellaneous' do
          execute :git, 'pull'
      end 
    end
  end
  task :pull_dance do
    on roles(:app) do
      within '/srv/www/stcpress/shared/public/sca_dance' do
          execute :git, 'pull'
      end 
    end
  end
  task :pull_bel do
    on roles(:app) do
      within '/srv/www/stcpress/shared/public/stcpress-data' do
          execute :git, 'pull'
      end 
      within '/srv/www/stcpress/shared/public/bel-accueil' do
          execute :git, 'pull'
      end 
    end
  end

  task :music_db do
    on roles(:app) do
      within release_path do
        with rails_env: fetch(:rails_env) do
          execute :rake, 'init_db:music'
        end
      end 
    end
  end

  task :dance_db do
    on roles(:app) do
      within release_path do
        with rails_env: fetch(:rails_env) do
          execute :rake, 'dance:all'
          execute :rake, 'json:search'
        end
      end 
    end
  end 

  task :restart do
    on roles(:app) do
      execute :sudo, '/bin/systemctl', 'restart', 'stcpress'
    end
  end

  task :all => [:pull_misc, :pull_bel, :pull_dance, :music_db, 'dance_db', :restart]
  task :misc => [:pull_misc, :music_db, :restart]
  task :bel => [:pull_bel, :music_db, :restart]
  task :dance => [:pull_dance, :dance_db, :restart]
end
