class Soapysdr < Formula
  desc "Vendor and platform neutral SDR support library"
  homepage "https://github.com/pothosware/SoapySDR/wiki"
  head "https://github.com/pothosware/SoapySDR.git"
  url "https://github.com/pothosware/SoapySDR/archive/soapy-sdr-0.6.0.tar.gz"
  sha256 "54b0f84edbd52a10073444d9124f41b622194744d136ea77e25c8b883e65abf9"

  depends_on "cmake" => :build
  depends_on "swig" => :build
  depends_on "python" => :recommended
  depends_on "python3" => :optional

  def install

    args = []

    args += ["-DUSE_PYTHON_CONFIG=ON"]

    if build.with?("python3")
      args += ["-DENABLE_PYTHON3=ON"]
    else
      args += ["-DENABLE_PYTHON3=OFF"]
    end

    if !(build.head?)
      args += ["-DSOAPY_SDR_EXTVER=release"]
    end

    args += %W[-DSOAPY_SDR_ROOT='#{HOMEBREW_PREFIX}']

    mkdir "build" do
      args += std_cmake_args
      system "cmake", "..", *args
      system "make", "install"
    end
  end
end
