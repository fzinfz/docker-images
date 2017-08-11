git clone https://github.com/GameXG/shadowsocks_admin.git
cd shadowsocks_admin
mv config.py.example config.py
cp *.py master_node/
sed -i "s/^AES_KEY.*/AES_KEY = \'myaeskey'/"  master_node/config.py
docker run  -v "$PWD":/shadowsocks_admin -w /shadowsocks_admin/master_node -it --rm fzinfz/django:sspanelByGameXG bash -c "python manage.py migrate"
docker run  -v "$PWD":/shadowsocks_admin -w /shadowsocks_admin/master_node -it --rm -p 8000:8000 fzinfz/django:sspanelByGameXG bash -c "python manage.py runserver 0.0.0.0:8000"

