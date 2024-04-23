cd /var/www/dev/bucket-ppgco-ufu/ &&

git checkout develop &&

git reset --hard origin/develop &&

git pull origin develop &&

pnpm install &&

sudo rm -rf dist &&

sudo cp /var/www/ppgco-vault/bucket-ppgco-ufu/dev/.env.dev /var/www/dev/bucket-ppgco-ufu/.env &&

pnpm build &&

if [ "$(pm2 id dev-bucket-ppgco-ufu) "= "[]" ]; then
  pm2 start dist/main.js --name dev-bucket-ppgco-ufu
  pm2 save
else
  pm2 stop dev-bucket-ppgco-ufu
  pm2 delete dev-bucket-ppgco-ufu
  pm2 start dist/main.js --name dev-bucket-ppgco-ufu
  pm2 save
fi