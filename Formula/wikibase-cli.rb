require "language/node"

class WikibaseCli < Formula
  desc "Command-line interface to Wikibase"
  homepage "https://github.com/maxlath/wikibase-cli#readme"
  url "https://registry.npmjs.org/wikibase-cli/-/wikibase-cli-17.0.2.tgz"
  sha256 "501577770673912c39e4c9752b7dd4359b650c86a4a71abc9d89505644340ef4"
  license "MIT"

  bottle do
    sha256 cellar: :any_skip_relocation, arm64_ventura:  "267ba69916edcd54d872dcf0a6f81832059e6d5d41f15b003cd4de8c8bfb823e"
    sha256 cellar: :any_skip_relocation, arm64_monterey: "267ba69916edcd54d872dcf0a6f81832059e6d5d41f15b003cd4de8c8bfb823e"
    sha256 cellar: :any_skip_relocation, arm64_big_sur:  "267ba69916edcd54d872dcf0a6f81832059e6d5d41f15b003cd4de8c8bfb823e"
    sha256 cellar: :any_skip_relocation, ventura:        "c3386074f84dd55f5b85b4e6d2af066097557eae00ab3f696c38bb040b9551b4"
    sha256 cellar: :any_skip_relocation, monterey:       "c3386074f84dd55f5b85b4e6d2af066097557eae00ab3f696c38bb040b9551b4"
    sha256 cellar: :any_skip_relocation, big_sur:        "c3386074f84dd55f5b85b4e6d2af066097557eae00ab3f696c38bb040b9551b4"
    sha256 cellar: :any_skip_relocation, x86_64_linux:   "267ba69916edcd54d872dcf0a6f81832059e6d5d41f15b003cd4de8c8bfb823e"
  end

  depends_on "node"

  def install
    system "npm", "install", *Language::Node.std_npm_install_args(libexec)
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    assert_equal "human", shell_output("#{bin}/wd label Q5 --lang en").strip
  end
end
