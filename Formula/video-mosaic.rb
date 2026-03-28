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

  resource "pillow" do
    url "https://files.pythonhosted.org/packages/d6/71/5026395b290ff404b836e636f51d7297e6c83beceaa87c592718747e670f/pillow-12.1.1-cp312-cp312-macosx_11_0_arm64.whl"
    sha256 "adebb5bee0f0af4909c30db0d890c773d1a92ffe83da908e2e9e720f8edf3984"
  end

  resource "rich" do
    url "https://files.pythonhosted.org/packages/14/25/b208c5683343959b670dc001595f2f3737e051da617f66c31f7c4fa93abc/rich-14.3.3-py3-none-any.whl"
    sha256 "793431c1f8619afa7d3b52b2cdec859562b950ea0d4b6b505397612db8d5362d"
  end

  resource "markdown-it-py" do
    url "https://files.pythonhosted.org/packages/94/54/e7d793b573f298e1c9013b8c4dade17d481164aa517d1d7148619c2cedbf/markdown_it_py-4.0.0-py3-none-any.whl"
    sha256 "87327c59b172c5011896038353a81343b6754500a08cd7a4973bb48c6d578147"
  end

  resource "mdurl" do
    url "https://files.pythonhosted.org/packages/b3/38/89ba8ad64ae25be8de66a6d463314cf1eb366222074cfda9ee839c56a4b4/mdurl-0.1.2-py3-none-any.whl"
    sha256 "84008a41e51615a49fc9966191ff91509e3c40b939176e643fd50a5c2196b8f8"
  end

  resource "pygments" do
    url "https://files.pythonhosted.org/packages/c7/21/705964c7812476f378728bdf590ca4b771ec72385c533964653c68e86bdc/pygments-2.19.2-py3-none-any.whl"
    sha256 "86540386c03d588bb81d44bc3928634ff26449851e99741617ecb9037ee5ec0b"
  end

  def install
    virtualenv_install_with_resources
  end

  test do
    assert_match "usage", shell_output("#{bin}/video-mosaic --help")
  end
end
