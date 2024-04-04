source ~/.nvm/nvm.sh &&
nvm use 20.10.0 &&
cd /var/www/ppgco-vault &&
git checkout main &&
git pull origin main &&
/bin/bash /var/www/ppgco-vault/api-ppgco-ufu/prod/deploy.sh