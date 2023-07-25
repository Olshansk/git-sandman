class GitSandman < Formula
  desc "Custom git command"
  homepage "https://github.com/olshansk/git-sandman"
  url "https://github.com/olshansk/git-sandman/archive/1.0.0.tar.gz"
  sha256 "put_the_sha256_of_your_tarball_here"

  def install
    bin.install "bin/git-sandman.sh" => "git-sandman"
  end

  test do
    system "#{bin}/git-sandman", "--version"
  end
end