export SCRIPT_AES256_ENCRYPTION_KEY=$(cat godot.gdkey)

oldPWD=$PWD
godotDir=$PWD/godot
export ANDROID_HOME=$PWD/cmdline-tools
cd $godotDir

echo "1" | sudo update-alternatives --config x86_64-w64-mingw32-g++ # patch for compiling windows from ubuntu

echo \#\#\#\#\# Building editors \#\#\#\#\#
scons platform=linuxbsd target=editor arch=x86_64 module_mono_enabled=yes lto=full production=yes optimize=speed
scons platform=windows target=editor arch=x86_64 module_mono_enabled=yes lto=full production=yes optimize=speed

echo \#\#\#\#\# Building linux templates \#\#\#\#\#
scons platform=linuxbsd target=template_release arch=x86_64 module_mono_enabled=yes lto=full production=yes optimize=speed
scons platform=linuxbsd target=template_debug arch=x86_64 module_mono_enabled=yes lto=full production=yes optimize=speed

echo \#\#\#\#\# Building windows templates \#\#\#\#\#
scons platform=windows target=template_release arch=x86_64 module_mono_enabled=yes lto=full production=yes optimize=speed
scons platform=windows target=template_debug arch=x86_64 module_mono_enabled=yes lto=full production=yes optimize=speed

echo \#\#\#\#\# Building android release template \#\#\#\#\#
scons platform=android target=template_release arch=arm64 module_mono_enabled=yes lto=full production=yes optimize=speed &&\
scons platform=android target=template_release arch=x86_64 module_mono_enabled=yes lto=full production=yes optimize=speed &&\
cd $godotDir/platform/android/java &&\
./gradlew generateGodotTemplates
cd $godotDir

echo \#\#\#\#\# Building android debug template \#\#\#\#\#
scons platform=android target=template_debug arch=arm64 module_mono_enabled=yes lto=full production=yes optimize=speed &&\
scons platform=android target=template_debug arch=x86_64 module_mono_enabled=yes lto=full production=yes optimize=speed &&\
cd $godotDir/platform/android/java &&\
./gradlew generateGodotTemplates
cd $godotDir

echo \#\#\#\#\# Stripping binaries \#\#\#\#\#
strip bin/*

cd $oldPWd