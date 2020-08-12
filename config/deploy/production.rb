# EC2サーバーのIP、EC2サーバーにログインするユーザー名、サーバーのロール(そのサーバーの役割)を記述
server '54.168.90.20', user: 'ta93n', roles: %w{app db web}

#デプロイするサーバーにsshログインする鍵の情報を記述
set :ssh_options, keys: '~/.ssh/Noodles_key_rsa'
