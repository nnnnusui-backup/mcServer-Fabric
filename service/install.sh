mcVer="1.19.2"
fabricVer="0.14.10"
fabricInstallerVer="0.11.1"
gitUserName="nnnnusui-backup"
gitUserEmail="nnnnusui+backup@gmail.com"

apt install -y openjdk-17-jre-headless

adduser minecraft --gecos "" --disabled-password
cd /home/minecraft

# install mcrcon
  apt install -y make gcc
  git clone https://github.com/Tiiffi/mcrcon.git
  cd mcrcon
  make
  sudo make install

git clone git@github.com:nnnnusui-backup/mcServer-Fabric.git server
cd server
git config --global user.name $gitUserName
git config --global user.email $gitUserEmail

wget -O installer.jar https://maven.fabricmc.net/net/fabricmc/fabric-installer/$fabricInstallerVer/fabric-installer-$fabricInstallerVer.jar
java -jar installer.jar server -mcversion $mcVer -downloadMinecraft
rm installer.jar
mv server.jar vanilla.jar
mv fabric-server-launch.jar server.jar
echo "serverJar=vanilla.jar" > fabric-server-launcher.properties

ln -s /lib/systemd/system/minecraft.service /home/minecraft/server/service/minecraft.service
