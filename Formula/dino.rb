class Dino < Formula
  desc "This is Dino+ A modern XMPP/Jabber client software, based on Dino"
  homepage ""
  url "https://github.com/mxlgv/dino/releases/tag/v0.4.3-fork-3/dino-0.4.3-for-3.tar.gz"
  sha256 "18fabae1dac231d6082ebce7bc3d157b04577e675dd3ac81f351b26eb99e7252"
  license "GPL-3.0"

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


  def install
    system "brew sh"
    system "./configure"
    system "make"
    system "exit"
  end

  test do
    assert_equal "Dino #{version}", shell_output("#{bin}/dino --version | head -n 1").strip
  end
end