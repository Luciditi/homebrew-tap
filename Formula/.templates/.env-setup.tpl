class EnvSetup < Formula

  desc "A workstation provisioner powered by Ansible & Homebrew"
  homepage "https://github.com/Luciditi/env-setup.git"
  url "${RELEASE_URL}"
  sha256 "${SHA256}"
  license "MIT License"
  head "https://github.com/Luciditi/env-setup.git", branch: "main"

  depends_on "ansible"
  depends_on "curl"
  depends_on "grep"

  def install
    libexec.install Dir["*"]
    bin.write_exec_script libexec/"scripts/env-setup"
    ohai "env-setup has been installed."
    ohai "Restart your shell and run env-setup."
  end

  def post_install
    if Dir.glob(File.expand_path('~').concat("/.ssh/id*")).empty?
      opoo "No SSH key was found in ~/.ssh/ dir."
      opoo "Please run ssh-keygen to install a SSH key for env-setup."
    end
  end

  test do
    system bin/"env-setup", prefix
  end
end
