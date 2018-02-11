# RasPiBlockstream

Installation Guide and patches to install gnuradio, Blockstream satellite, and bitcoin-fibre into Raspberry Pi 3 model B

## Description

Quick and dirty installation guide and some patches to reduce your pain for installation Blockstream, gnuradio, and bitcoin-fibre into Raspberry Pi 3 model B. My goal is this project can be start point of the making up portable bitcoin transaction system with low-cost and small single-board computer.

For more information, see https://github.com/Chirimen-Jako/RasPiBlockstream/doc

## Requirement

- RASPBIAN STRETCH WITH DESKTOP boot image file.
- Raspberry Pi 3 model B
- 8GB reasonable price & speed microSD card
- USB-HDD (500GB～2GB)
- Reliable 5V USB Power Source
- RTL-SDR

## Installation

    Quick start:

        Download the following 2 files.
            https://github.com/Chirimen-Jako/RasPiBlockstream/doc/InstallGuideBlockstreamRasPi3B_0.01.pdf
            https://github.com/Chirimen-Jako/RasPiBlockstream/tarball/build_Blockstream_RasPi3B-2018-02-07_1.tar.gz

    Clone repository:

        $ git clone https://github.com/Chirimen-Jako/RasPiBlockstream

## Trouble Shootings

    You can compare your buildall.log with the following successful build log.

        https://github.com/Chirimen-Jako/RasPiBlockstream/tarball/success-example-buildall.tar.gz

## Anything Else

Software building is confirmed many times.
I didn't confirm if it can catch satellite beam because there is no Blockstream satellite broadcasting in my region.
Wait for Blockstream announce.

## Author

[@Luqina](https://twitter.com/Luqina)

## License

[MIT](http://b4b4r07.mit-license.org)
