# install dependencies
sudo apt update
sudo apt upgrade
#linuxbsd
sudo apt-get install \
  build-essential \
  scons \
  pkg-config \
  libx11-dev \
  libxcursor-dev \
  libxinerama-dev \
  libgl1-mesa-dev \
  libglu-dev \
  libasound2-dev \
  libpulse-dev \
  libudev-dev \
  libxi-dev \
  libxrandr-dev
#win
sudo apt install mingw-w64
#android
wget "https://dl.google.com/android/repository/commandlinetools-linux-11076708_latest.zip" -P /tmp
mv "commandlinetools-linux-11076708_latest.zip" "cmdline-tools.zip"
unzip "cmdline-tools.zip"
sudo wget -qO - https://packages.adoptium.net/artifactory/api/gpg/key/public | sudo gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/adoptium.gpg > /dev/null
sudo echo "deb https://packages.adoptium.net/artifactory/deb $(awk -F= '/^VERSION_CODENAME/{print$2}' /etc/os-release) main" | sudo tee /etc/apt/sources.list.d/adoptium.list
sudo apt update
sudo apt-get install temurin-17-jdk

#setup
#android
export ANDROID_HOME=$PWD/cmdline-tools
source ~/.bashrc
$ANDROID_HOME/bin/sdkmanager --sdk_root=$ANDROID_HOME --licenses -y
$ANDROID_HOME/bin/sdkmanager --sdk_root=$ANDROID_HOME "platform-tools" "build-tools;33.0.2" "platforms;android-33" "cmdline-tools;latest" "cmake;3.10.2.4988404" "ndk;23.2.8568313"
$ANDROID_HOME/bin/sdkmanager --sdk_root=$ANDROID_HOME "platform-tools" "build-tools;30.0.3" "platforms;android-29" "cmdline-tools;latest" "cmake;3.10.2.4988404"

sdk install gradle

# clone godot source
git clone --branch 4.2.1-stable https://github.com/godotengine/godot.git