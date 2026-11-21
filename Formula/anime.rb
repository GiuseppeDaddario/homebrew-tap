class Anime < Formula
  desc "Terminal anime catalogue, playback and Telegram history"
  homepage "https://github.com/GiuseppeDaddario/anime"
  license "MIT"
  version "0.2.0"
  depends_on :macos
  depends_on "mpv"

  on_arm do
    url "https://github.com/GiuseppeDaddario/anime/releases/download/v0.2.0/anime_v0.2.0_darwin_arm64.tar.gz"
    sha256 "873f98179610a9107cfe44de0cb9a486de63e1f2fb98d1f83e1f509caaf47872"
  end
  on_intel do
    url "https://github.com/GiuseppeDaddario/anime/releases/download/v0.2.0/anime_v0.2.0_darwin_amd64.tar.gz"
    sha256 "5a220a8d698b18e0caa274cd83b1b86eee4c4714bd232c2bd11aa2d199a66300"
  end

  def install
    bin.install "anime"
  end

  test do
    assert_match "anime", shell_output("#{bin}/anime --version")
    assert_match "--continue", shell_output("#{bin}/anime --help")
    assert_predicate Formula["mpv"].opt_bin/"mpv", :executable?
    system "#{bin}/anime", "--player", "--no-config", "--vo=null", "--ao=null",
           "--frames=1", "av://lavfi:testsrc=size=64x64:rate=1"
  end
end
