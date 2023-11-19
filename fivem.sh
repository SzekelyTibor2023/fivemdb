# Felhasználónév bekérése
read -p "Kérlek, add meg a felhasználónevet: " username

# Jelszó bekérése
read -s -p "Kérlek, add meg a jelszót: " password
echo

# Adatbázisnév bekérése
read -p "Kérlek, add meg az adatbázis nevét: " dbname

# MySQL-be történő belépés
mysql -u root -p <<EOF
CREATE DATABASE IF NOT EXISTS $dbname;
CREATE USER IF NOT EXISTS '$username'@'%' IDENTIFIED BY '$password';
GRANT ALL PRIVILEGES ON $dbname.* TO '$username'@'%';
FLUSH PRIVILEGES;
EXIT
EOF

echo "Az adatbázis, felhasználó és jogosultságok sikeresen létrehozva."
