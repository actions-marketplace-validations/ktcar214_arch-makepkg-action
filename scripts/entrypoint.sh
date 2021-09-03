#! /bin/sh -l

if [ -d "/github" ]; then
sudo chown -R build /github/workspace /github/home
fi

pwd
export MAKEFLAGS="-j$(nproc)"
namcap PKGBUILD

if test -f "./prebuild.sh" ; then
bash ./prebuild.sh
fi

if test -f "./prebuild.sh" ; then
bash ./build.sh
else
sudo pacman -Syu --noconfirm && makepkg -fC --syncdeps --noconfirm
fi

if test -f "./postbuild.sh" ; then
bash ./postbuild.sh
fi

echo "==============="
echo "Package created:"
ls -lah *.pkg.tar.zst`
echo "==============="
