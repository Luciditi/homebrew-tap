class EnvSetup < Formula

  desc "A workstation provisioner powered by Ansible & Homebrew"
  homepage "https://github.com/Luciditi/env-setup.git"
  url "https://github.com/Luciditi/env-setup/archive/refs/tags/v1.3.0.tar.gz"
  sha256 "3d7639b8fd2e8164bdf9807bfef57dee7236caeb0d36cb6532cb3a1657392d1f"
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
    require 'net/http'

    gh = 'https://raw.githubusercontent.com/Luciditi/env-setup/main'
    configs = ['/.none.config.yml', '/.mini.config.yml', '/.most.config.yml']
    configs.each {
      |config| IO.write(libexec.to_s.concat(config), Net::HTTP.get(URI(gh.concat(config))))
    }

    if Dir.glob(File.expand_path('~').concat("/.ssh/id*")).empty?
      opoo "No SSH key was found in ~/.ssh/ dir."
      opoo "Please run ssh-keygen to install a SSH key for env-setup."
    end
  end

  test do
    system bin/"env-setup", prefix
  end
end
