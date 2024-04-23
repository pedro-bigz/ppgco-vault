cd /var/www/prod/bucket-ppgco-ufu/ &&

git checkout main &&

git pull &&

pnpm install &&

sudo rm -rf dist &&

sudo cp /var/www/ppgco-vault/bucket-ppgco-ufu/prod/.env.prod /var/www/prod/bucket-ppgco-ufu/.env &&

pnpm build &&

if [ "$(pm2 id bucket-ppgco-ufu) "= "[]" ]; then
  pm2 start dist/main.js --name bucket-ppgco-ufu
  pm2 save
else
  pm2 stop bucket-ppgco-ufu
  pm2 delete bucket-ppgco-ufu
  pm2 start dist/main.js --name bucket-ppgco-ufu
  pm2 save
fi