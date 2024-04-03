cd /var/www/dev/api-ppgco-ufu/ &&

git checkout main &&

git pull &&

pnpm install &&

rm -rf dist &&

cp /var/www/ppgco-vault/api-ppgco-ufu/dev/.env.dev /var/www/dev/api-ppgco-ufu/.env &&

pnpm build &&

if [ "$(pm2 id dev-api-ppgco-ufu) "= "[]" ]; then
  pm2 start dist/src/main.js --name dev-api-ppgco-ufu
  pm2 save
else
  pm2 stop dev-api-ppgco-ufu
  pm2 delete dev-api-ppgco-ufu
  pm2 start dist/src/main.js --name dev-api-ppgco-ufu
  pm2 save
fi