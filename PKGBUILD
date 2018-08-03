pkgname=surf-najeeb
basepkgname=surf
pkgver=2.0
pkgrel=1
pkgdesc="a WebKit based browser"
arch=('x86_64')
url="http://surf.suckless.org/"
license=('custom:MIT/X')
depends=('webkit2gtk' 'gcr' 'xorg-xprop')
makedepends=('git')
optdepends=('dmenu: url bar and search'
            'tabbed: tab browsing'
            'ca-certificates: SSL verification'
            'st: default terminal for the download handler'
            'curl: default download handler'
            'mpv: default video player')
provides=("$pkgbasename")
conflicts=("$pkgbasename")
source=(
  "https://dl.suckless.org/surf/$basepkgname-$pkgver.tar.gz"
  "https://surf.suckless.org/patches/spacesearch/surf-spacesearch-20170408-b814567.diff"
  "config.h"
  "surf.desktop"
)

md5sums=('SKIP')

prepare() {
  cd $srcdir/$basepkgname-$pkgver
  for file in "${source[@]}"; do
      if [[ "$file" == "config.h" ]]; then
          # add config.h if present in source array
          cp "$srcdir/$file" .
      elif [[ "$file" == *.diff || "$file" == *.patch ]]; then
          # add all patches present in source array
          patch -Np1 < "$srcdir/$(basename ${file})"
      fi
   done
}

build() {
  cd $srcdir/$basepkgname-$pkgver
  make PREFIX=/usr DESTDIR="$pkgdir"
}

package() {
  cd $srcdir/$basepkgname-$pkgver
  make PREFIX=/usr DESTDIR="$pkgdir" install
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 -D $srcdir/surf.desktop $pkgdir/usr/share/xsessions/surf.desktop
}
