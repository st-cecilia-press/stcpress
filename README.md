# stcpress ~ a repository for pre-1700 music
live site: http://stcpress.org

## Setting up stcpress for development

Clone the repo
```
git clone git@github.com:st-cecilia-press/stcpress.git
cd stcpress
bundle
```
Make sure dependencies are installed
* g++
* libmysqlclient-dev
* libsqlite3-dev

capybara-webkit needs Qt. I installed: 
* qt5-make
* qt5-default
* libqt*5-dev
* qt*5-dev
* qml-module-qtquick-*
* qt*5-doc-html

Set up database
```
bundle exec rake db:setup
```

make sure node and yarn are at versions in package.json

I use nvm to install node, so to get node to the correct version 
```
nvm install [version]
```

for yarn: 
```
curl -o- -L https://yarnpkg.com/install.sh | bash -s -- --version [version]
source .bashrc
```

compile javascript and css
```
bundle exec rails assets:precompile
```
set up music repositories
```
bundle exec rake git_pull
bundle exec rake init_db:all
```
