class ForkCleaner < Formula
  desc "Cleans up old and inactive forks on your GitHub account"
  homepage "https://github.com/caarlos0/fork-cleaner"
  url "https://github.com/caarlos0/fork-cleaner/archive/v1.7.0.tar.gz"
  sha256 "f95140760f79e33456372161a402b7b94d6309f8b69d21fc6430289bab340b5f"
  license "MIT"

  bottle do
    cellar :any_skip_relocation
    sha256 "353d7a6cf72270b7b1b781a2a54d6c2988df13ad0d1bedbd7a4a95df57d3a80e" => :catalina
    sha256 "de0183023d54445aa5e7cd5820fdfb1330940d349e47f0dfb6dfbf78280f5e26" => :mojave
    sha256 "c9497f1b6cc8f4435cae83456ac2e5d605877345fb3dc05dbbc872eaeb0cc52b" => :high_sierra
  end

  depends_on "go" => :build

  def install
    system "make"
    bin.install "fork-cleaner"
    prefix.install_metafiles
  end

  test do
    output = shell_output("#{bin}/fork-cleaner 2>&1", 1)
    assert_match "missing github token", output
  end
end
