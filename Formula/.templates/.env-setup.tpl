class EnvSetup < Formula
  desc "A workstation provisioner powered by Ansible & Homebrew"
  homepage "https://github.com/Luciditi/env-setup"
  url "${RELEASE_URL}"
  sha256 "${SHA256}"
  license "MIT"
  head "https://github.com/Luciditi/env-setup.git", branch: "main"

  depends_on "ansible"
  depends_on "curl"
  depends_on "grep"
  depends_on "jq"

  def install
    libexec.install Dir["*"]
    libexec.install Dir[".*.config.yml"]
    bin.write_exec_script libexec/"scripts/env-setup"
    ohai "env-setup has been installed."
    ohai "Restart your shell and run env-setup."
  end

  def post_install
    if Dir.glob(File.expand_path("~/.ssh/id*")).empty?
      opoo "No SSH key was found in ~/.ssh/ dir."
      opoo "Please run ssh-keygen to install a SSH key for env-setup."
    end
  end

  test do
    system bin/"env-setup", "--help"
  end
end
