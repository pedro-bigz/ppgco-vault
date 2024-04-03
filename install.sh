sudo chmod -R 755 /var/www/ &&

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash &&

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh";

nvm install 20.10.0 &&
nvm  use 20.10.0 &&

npm install -g pnpm &&
npm install -g pm2 &&