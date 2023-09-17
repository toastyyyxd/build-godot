oldPWD=$PWD
cd /workspaces/godot-doubles/godot

echo Start compiling
scons platform=windows arch=x86_64 precision=double target=editor lto=full production=true
echo Finished compiling, stripping executables
strip /workspaces/godot-doubles/godot/bin/godot.windows.editor.double.x86_64.exe
strip /workspaces/godot-doubles/godot/bin/godot.windows.editor.double.x86_64.console.exe
echo Done

cd $oldPWdp