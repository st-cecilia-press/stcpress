# stcpress ~ a repository for pre-1700 music
live site: http://stcpress.org


## Setting up stcpress for development

Clone the repo
```
git clone git@github.com:st-cecilia-press/stcpress.git
cd stcpress
bundle
```
copy .env-example directory to .env
```
cp -r .env-example .env
```

build web container
```
docker-compose build web
```

precompile assets
```
docker-compose run web bundle exec rails assets:precompile
```

start containers
```
docker-compose up -d
```

set up database and music repositories
```
docker-compose exec web bundle exec rake git_pull
docker-compose exec web bundle exec rails db:setup
docker-compose exec web bundle exec rake init_db:all
```
