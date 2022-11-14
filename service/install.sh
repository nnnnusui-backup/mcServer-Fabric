mcVer="1.19.2"
fabricVer="0.14.10"
fabricInstallerVer="0.11.1"
gitUserName="nnnnusui-backup"
gitUserEmail="nnnnusui+backup@gmail.com"

apt install -y openjdk-17-jre-headless
apt install -y make gcc

adduser minecraft --gecos "" --disabled-password
cd /home/minecraft

# install mcrcon
  git clone https://github.com/Tiiffi/mcrcon.git
  make -C mcrcon
  sudo make -C mcrcon install

cd /home/minecraft
sudo -u minecraft git clone git@github.com:nnnnusui-backup/mcServer-Fabric.git server
cd server
git config --global user.name $gitUserName
git config --global user.email $gitUserEmail

sudo -u minecraft wget -O installer.jar https://maven.fabricmc.net/net/fabricmc/fabric-installer/$fabricInstallerVer/fabric-installer-$fabricInstallerVer.jar
sudo -u minecraft java -jar installer.jar server -mcversion $mcVer -downloadMinecraft
rm installer.jar
mv server.jar vanilla.jar
mv fabric-server-launch.jar server.jar
echo "serverJar=vanilla.jar" > fabric-server-launcher.properties

rm /lib/systemd/system/minecraft.service
ln -s /home/minecraft/server/service/minecraft.service /lib/systemd/system/minecraft.service
