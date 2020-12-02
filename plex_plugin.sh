sudo apt-get install git wget

cd "/config/Library/Application Support/Plex Media Server"

mkdir -p "Scanners/Series/"
cd Scanners/Series/

wget https://raw.githubusercontent.com/ZeroQI/Absolute-Series-Scanner/master/Scanners/Series/Absolute%20Series%20Scanner.py


cd ../../Plug-ins

git clone https://github.com/ZeroQI/Hama.bundle.git

chmod -R 777 ..
chown -R abc:abc ..

