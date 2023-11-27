# Install PostgreSQL 
# Create the file repository configuration

sudo apt update
sudo apt upgrade -y
sudo apt install -y git

sudo apt update && sudo apt upgrade -y # Install the latest version of PostgreSQL
sudo apt install postgresql postgresql-common postgresql-contrib # Install build dependencies
sudo apt install build-essential libxml2-dev # Install Qt
sudo apt install qtcreator qt5-default libpq-dev libqt5svg5-dev # Set up our local environment
export QT_ROOT=/usr/lib/qt5
export INSTALLATION_ROOT=~/.sw/pgmodeler/bin/0.9.4
mkdir -p $INSTALLATION_ROOT # Get the pgModeler repo
cd ~/.sw/pgmodeler/bin/0.9.4
git clone https://github.com/pgmodeler/pgmodeler.git
cd pgmodeler
git pull
git checkout v0.9.4 # Configure the build
# cd ~/.sw/pgmodeler/bin/0.9.4
qmake -r CONFIG+=release \
PREFIX=$INSTALLATION_ROOT \
BINDIR=$INSTALLATION_ROOT \
PRIVATEBINDIR=$INSTALLATION_ROOT \
PRIVATELIBDIR=$INSTALLATION_ROOT/lib pgmodeler.pro # Build pgModeler
# cd ~/.sw/pgmodeler/bin/0.9.4
make
make install
echo "PGModeler Instalado :)"
