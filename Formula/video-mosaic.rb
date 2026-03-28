# Users install with:
#   brew tap GonzaloFuentes28/tap
#   brew install video-mosaic

class VideoMosaic < Formula
  include Language::Python::Virtualenv

  desc "Extract video frames and compose them into a mosaic image"
  homepage "https://github.com/GonzaloFuentes28/video-mosaic"
  url "https://github.com/GonzaloFuentes28/video-mosaic/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "df16333a1f63084cb9b3f86ca37a82a5682bc8806d8a754351746a261ae64385"
  license "MIT"

  depends_on "ffmpeg"
  depends_on "python@3.12"

  def install
    virtualenv_create(libexec, "python3.12")
    system libexec/"bin/pip", "install", "video-mosaic==#{version}"
  end

  test do
    assert_match "usage", shell_output("#{bin}/video-mosaic --help")
  end
end
