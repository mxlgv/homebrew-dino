class Dino < Formula
  desc "This is Dino+ A modern XMPP/Jabber client software, based on Dino"
  homepage ""
  url "https://github.com/mxlgv/dino/archive/refs/tags/v0.4.3-fork-3.tar.gz"
  sha256 "e123cf60b041b8670f8f460cb919825a4fbcb83adbee84a5d5327aaf52c46547"
  license "GPL-3.0"

  depends_on "libadwaita"
  depends_on "libcanberra"
  depends_on "adwaita-icon-theme"
  depends_on "glib"
  depends_on "glib-networking"
  depends_on "gpgme"
  depends_on "icu4c"
  depends_on "libgpg-error"
  depends_on "libgcrypt"
  depends_on "gtk+3"
  depends_on "gtk4"
  depends_on "libsignal-protocol-c"
  depends_on "libgee"
  depends_on "libsoup"
  depends_on "libsoup@2"
  depends_on "sqlite"
  depends_on "cmake"
  depends_on "gettext"
  depends_on "ninja"
  depends_on "vala"
  depends_on "qrencode"
  depends_on "libxml2"
  depends_on "gspell"
  depends_on "gst-plugins-base"
  depends_on "srtp"
  depends_on "libnice"

  on_macos do
    patch do
      # FIXME: libsoup error, always use libsoup3
      # --with-libsoup3 does not seem to work sometimes
      url "https://raw.githubusercontent.com/mxlgv/homebrew-dino/master/formula-patches/libsoup.patch"
      sha256 "424eedde217b1e753bfa87a2846506becde102555bb00545c36f666a2550290d"
    end
  end


  def install
    # https://rubydoc.brew.sh/Formula.html#std_configure_args-instance_method
    ggetopt_path = Formula['gnu-getopt'].bin
    with_env({"PATH" => "#{ggetopt_path}:#{ENV['PATH']}"
    }) do
      # system "./configure", *std_configure_args, "--with-libsoup3"
      system "./configure", *std_configure_args
      system "make"
      system "make", "install"
      system "export DYLD_LIBRARY_PATH=/opt/homebrew/Cellar/dino/3/lib"
      # system "sudo ln -s /opt/homebrew/Cellar/dino/3/bin/dino /Applications/Dino"
    end
      ohai "renaming plugin extensions { .dylib => .so }"
      plugins = lib/"dino/plugins"
      plugins.glob("*.dylib").each do |plugin|
        ohai "  * #{plugin.basename('.dylib')}"
        plugin.rename(plugin.sub_ext('.so'))
      end
  end

  test do
    assert_equal "Dino #{version}", shell_output("#{bin}/dino --version | head -n 1").strip
  end
end
