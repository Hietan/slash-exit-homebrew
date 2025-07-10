class SlashExit < Formula
  desc "A joke command for /exit typos, inspired by sl command"
  homepage "https://github.com/Hietan/slash-exit-homebrew"
  url "https://github.com/Hietan/slash-exit-homebrew/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "9692368a8aa30474c369f74272bfb270764189da658c0fd478604e1a43e4ea15"
  license "Apache-2.0"
  version "1.0.0"

  def install
    bin.install "bin/slash-exit"
    bin.install "bin/slash-exit-enable"
  end

  def caveats
    <<~EOS
      slash-exit has been installed! 
      
      To enable the /exit command, run:
        #{Tty.green}slash-exit-enable#{Tty.reset}
      
      This will add a function to your shell configuration.
      
      Designed for Claude Code users who accidentally type /exit 😊
    EOS
  end

  test do
    # Test that the binary exists and is executable
    assert_predicate bin/"slash-exit", :exist?
    assert_predicate bin/"slash-exit", :executable?
    
    # Test that the setup script exists and is executable
    assert_predicate bin/"slash-exit-enable", :exist?
    assert_predicate bin/"slash-exit-enable", :executable?
    
    # Test help output
    assert_match "slash-exit-enable - Setup script", shell_output("#{bin}/slash-exit-enable -h")
    
    # Test that the main command runs without error in debug mode
    system "#{bin}/slash-exit"
    assert_equal 0, $CHILD_STATUS.exitstatus
  end
end