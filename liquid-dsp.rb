require "formula"

class LiquidDsp < Formula
  desc "digital signal processing library for software-defined radios"
  homepage "http://liquidsdr.org/"
  head "https://github.com/jgaeddert/liquid-dsp.git"
  url "https://github.com/jgaeddert/liquid-dsp/archive/v1.3.0.tar.gz"
  sha256 "b136343d644bc1441f7854f2d292bfa054e8d040c0b745879b205f6836dca0f0"
  
  depends_on "fftw"
  depends_on "autoconf" => :build
  depends_on "automake" => :build
  depends_on "libtool" => :build
  depends_on "pkg-config" => :build

  def install
    system "./bootstrap.sh"
    system "./configure", "--prefix=#{prefix}"
    system "make"
    system "make", "install"
  end
end
