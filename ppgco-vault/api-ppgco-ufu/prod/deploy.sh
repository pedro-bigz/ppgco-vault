cd /var/www/prod/api-ppgco-ufu/ &&

git checkout main &&

git pull &&

pnpm install &&

rm -rf dist &&

cp /var/www/ppgco-vault/api-ppgco-ufu/prod/.env.prod /var/www/prod/api-ppgco-ufu/.env &&

pnpm build &&

if [ "$(pm2 id api-ppgco-ufu) "= "[]" ]; then
  pm2 start dist/src/main.js --name api-ppgco-ufu
  pm2 save
else
  pm2 stop api-ppgco-ufu
  pm2 delete api-ppgco-ufu
  pm2 start dist/src/main.js --name api-ppgco-ufu
  pm2 save
fi