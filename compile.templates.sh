oldPWD=$PWD
cd /workspaces/godot-doubles/godot

echo Start compiling release template
scons platform=windows arch=x86_64 precision=double target=template_debug lto=full production=true
echo Compiling debug template
scons platform=windows arch=x86_64 precision=double target=template_release lto=full

cd $oldPWd