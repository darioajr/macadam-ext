class MacadamExt < Formula
  desc "Port forwarding and SCP helpers for macadam VMs"
  homepage "https://github.com/darioajr/macadam-ext"
  url "https://github.com/darioajr/macadam-ext/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "bef94f30b2f0d1f4ad17bb622e55bdf1e3df9cbc48213b9edcd7ac9789f924f2"
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