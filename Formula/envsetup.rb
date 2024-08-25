class EnvSetup < Formula
  include Language::Python::Virtualenv

  desc "A workstation provisioner powered by Ansible & Homebrew"
  homepage "https://github.com/Luciditi/env-setup.git"
  url "https://github.com/Luciditi/env-setup/archive/refs/tags/v1.2.1.tar.gz"
  sha256 "d9876bf60feb28d6fde951dbaebac965aec9ed205ce7de8e89dc62c72f490256"
  license "MIT License"
  head "https://github.com/Luciditi/env-setup.git", branch: "main"

  depends_on "ansible"
  depends_on "curl"
  depends_on "grep"

  # https://rubydoc.brew.sh/Formula#install-instance_method
  def install
    system "echo 'done'"
  end
end
