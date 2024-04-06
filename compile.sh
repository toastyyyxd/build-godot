export SCRIPT_AES256_ENCRYPTION_KEY=$(cat godot.gdkey)

oldPWD=$PWD
cd $PWD/godot

scons platform=linuxbsd target=editor arch=x86_64 module_mono_enabled=yes lto=full production=yes
scons platform=windows target=editor arch=x86_64 module_mono_enabled=yes lto=full production=yes

scons platform=linuxbsd target=template_release arch=x86_64 module_mono_enabled=yes lto=full production=yes
scons platform=linuxbsd target=template_debug arch=x86_64 module_mono_enabled=yes lto=full production=yes

scons platform=windows target=template_release arch=x86_64 module_mono_enabled=yes lto=full production=yes
scons platform=windows target=template_debug arch=x86_64 module_mono_enabled=yes lto=full production=yes

scons platform=android target=template_release arch=arm64 module_mono_enabled=yes debug_symbols=no lto=full production=yes
scons platform=android target=template_release arch=x86_64 module_mono_enabled=yes debug_symbols=no lto=full production=yes generate_apk=yes
scons platform=android target=template_debug arch=arm64 module_mono_enabled=yes debug_symbols=no lto=full production=yes
scons platform=android target=template_debug arch=x86_64 module_mono_enabled=yes debug_symbols=no lto=full production=yes generate_apk=yes

strip bin/*

cd $oldPWd