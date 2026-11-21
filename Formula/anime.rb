class Anime < Formula
  desc "Terminal anime catalogue, playback and Telegram history"
  homepage "https://github.com/GiuseppeDaddario/anime"
  license "MIT"
  version "0.1.0"
  depends_on :macos
  depends_on "mpv"

  on_arm do
    url "https://github.com/GiuseppeDaddario/anime/releases/download/v0.1.0/anime_v0.1.0_darwin_arm64.tar.gz"
    sha256 "ce26bf6ba989a5dd0381238c513fa7eeda38bf096d9b0db07270e8d9675b9cf9"
  end
  on_intel do
    url "https://github.com/GiuseppeDaddario/anime/releases/download/v0.1.0/anime_v0.1.0_darwin_amd64.tar.gz"
    sha256 "1a401e3ba0c8ce1470b4cea81dbf6aacd57400678047b91da8fecc8ba101c809"
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
