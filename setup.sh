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
sudo apt-get install mingw-w64
#android
if [ ! -d $PWD/cmdline-tools ]; then
  wget "https://dl.google.com/android/repository/commandlinetools-linux-11076708_latest.zip" -P /tmp
  unzip "/tmp/commandlinetools-linux-11076708_latest.zip"
fi
curl -s https://get.sdkman.io | bash
source "$HOME/.sdkman/bin/sdkman-init.sh"
sdk install java 17.0.10-tem
sdk install gradle

#setup
#android
export ANDROID_HOME=$PWD/cmdline-tools
source ~/.bashrc
$ANDROID_HOME/bin/sdkmanager --sdk_root=$ANDROID_HOME --licenses
$ANDROID_HOME/bin/sdkmanager --sdk_root=$ANDROID_HOME "platform-tools" "build-tools;33.0.2" "platforms;android-33" "cmdline-tools;latest" "cmake;3.10.2.4988404" "ndk;23.2.8568313"
$ANDROID_HOME/bin/sdkmanager --sdk_root=$ANDROID_HOME "platform-tools" "build-tools;30.0.3" "platforms;android-29" "cmdline-tools;latest" "cmake;3.10.2.4988404"


# clone godot source
if [ ! -d $PWD/godot ]; then
  git clone --branch 4.2.1-stable "https://github.com/godotengine/godot.git"
else
  echo "Godot directory already exists, not cloning."
fi