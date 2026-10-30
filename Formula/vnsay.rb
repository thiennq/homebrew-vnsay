class Vnsay < Formula
  desc "Vietnamese text to speech on your own computer (ZeroTTS model)"
  homepage "https://github.com/thiennq/vnsay-releases"
  url "https://github.com/thiennq/vnsay-releases/releases/download/v0.1.0/vnsay-0.1.0-macos-universal2.tar.gz"
  sha256 "3cc82fff9258ade97d3cb2418ae78fb8f4f46406480da4ab1b98a336570391be"
  license "MIT"

  # One universal2 program for Apple Silicon and Intel; its x86_64 slice runs
  # lib/vnsay/vnsay-haswell on a CPU with AVX2.
  depends_on macos: :ventura

  def install
    bin.install "bin/vnsay"
    (lib/"vnsay").install Dir["lib/vnsay/*"]
    doc.install "NOTICE", "LICENSES", "README-install.txt", "AGENTS.md"
  end

  service do
    run [opt_bin/"vnsay", "serve"]
    keep_alive crashed: true
    log_path var/"log/vnsay.log"
    error_log_path var/"log/vnsay.log"
  end

  def caveats
    <<~EOS
      Download the model (about 200 MB, into ~/.vnsay) before the first use:
        vnsay model install
      Then: vnsay say --play "Xin chào"

      To keep a server running (port 28765, starts at login), either:
        brew services start vnsay
      or vnsay's own LaunchAgent, which also restarts it after a crash:
        vnsay service install
      Use one of the two, not both. `brew uninstall vnsay` keeps ~/.vnsay.
    EOS
  end

  test do
    assert_match "vnsay #{version}", shell_output("#{bin}/vnsay --version")
    assert_match "ZeroTTS", shell_output("#{bin}/vnsay --version")
  end
end
