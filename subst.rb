# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class Subst < Formula
  desc ""
  homepage ""
  version "0.0.1-alpha8"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/buttahtoast/subst/releases/download/v0.0.1-alpha8/subst_0.0.1-alpha8_darwin_arm64.tar.gz"
      sha256 "d1103a4332f8f6e332237682f019e91ec254d0a56a1ca8b72a697378b63e29ac"

      def install
        bin.install "subst"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/buttahtoast/subst/releases/download/v0.0.1-alpha8/subst_0.0.1-alpha8_darwin_amd64.tar.gz"
      sha256 "16af3550e3feca0272e1f1d6b271797cfecb48be08f52f163db1376645cb2b67"

      def install
        bin.install "subst"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/buttahtoast/subst/releases/download/v0.0.1-alpha8/subst_0.0.1-alpha8_linux_arm64.tar.gz"
      sha256 "877b6002235a292d4fe3cf7661f5163c10f2375f8a4f10f4ff0678b28434887f"

      def install
        bin.install "subst"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/buttahtoast/subst/releases/download/v0.0.1-alpha8/subst_0.0.1-alpha8_linux_amd64.tar.gz"
      sha256 "5db2d95894afb57a2155894b25cc645b63c51b3ff29ee7c778eaf45a1b65eca0"

      def install
        bin.install "subst"
      end
    end
    if Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
      url "https://github.com/buttahtoast/subst/releases/download/v0.0.1-alpha8/subst_0.0.1-alpha8_linux_armv6.tar.gz"
      sha256 "660ea10f7cc707f4d462dbee1ca123cff06d1c7a84505273717efc5cbab943aa"

      def install
        bin.install "subst"
      end
    end
  end
end
