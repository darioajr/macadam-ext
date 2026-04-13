class MacadamExt < Formula
  desc "Port forwarding and SCP helpers for macadam VMs"
  homepage "https://github.com/darioajr/macadam-ext"
  url "https://github.com/darioajr/macadam-ext/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "REPLACE_WITH_TARBALL_SHA256"
  license "MIT"
  head "https://github.com/darioajr/macadam-ext.git", branch: "main"

  def install
    bin.install "macadam-port"
    bin.install "macadam-scp"
  end

  test do
    assert_match "Usage:", shell_output("#{bin}/macadam-port --help 2>&1")
    assert_match "Usage:", shell_output("#{bin}/macadam-scp --help 2>&1")
  end
end