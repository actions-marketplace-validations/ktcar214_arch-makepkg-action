#! /bin/sh -l

if [ -d "/github" ]; then
sudo chown -R build /github/workspace /github/home
fi

pwd
export MAKEFLAGS="-j$(nproc)"
namcap PKGBUILD
gpg --keyserver keyserver.ubuntu.com --recv-keys 647F28654894E3BD457199BE38DBBDC86092693E
sudo pacman -Syu --noconfirm && makepkg -fC --syncdeps --noconfirm

echo "==============="
echo "Package created:"
echo `ls -lah *.pkg.tar.zst`
echo "==============="
