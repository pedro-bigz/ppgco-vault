sudo chmod -R 777 /var/www &&
source ~/.nvm/nvm.sh &&
nvm use 20.10.0 &&
cd /var/www/ppgco-vault &&
git reset --hard origin/main &&
git checkout main &&
git pull origin main &&
/bin/bash /var/www/ppgco-vault/$1-ppgco-ufu/prod/deploy.sh &&
/bin/bash /var/www/ppgco-vault/restart-nginx.sh &&
sudo chmod -R 755 /var/www