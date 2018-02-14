# RasPiBlockstream

Installation Guide and patches to install gnuradio, Blockstream satellite, and bitcoin-fibre into Raspberry Pi 3 model B

## Description

Quick and dirty installation guide and some patches to reduce your pain for installation Blockstream, gnuradio, and bitcoin-fibre into Raspberry Pi 3 model B. My goal is this project can be start point of the making up portable bitcoin transaction system with low-cost and small single-board computer.

For more information, see https://github.com/Chirimen-Jako/RasPiBlockstream/doc

## Requirements

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

## Special Thanks

I'm inspired and received a lot of information from [grubles](https://twitter.com/notgrubles) and the following links.
    If you want to construct normal Blockstream station (not using Raspberry Pi, but also with enough powerful PC), you should refer to the following links.

  [Building Your Own Bitcoin Satellite Node: Part 1 — Hardware Assembly](https://hackernoon.com/building-your-own-bitcoin-satellite-node-6061d3c93e7) 

  [Building Your Own Bitcoin Satellite Node: Part 2 — Software Installation](https://medium.com/@notgrubles/building-your-own-bitcoin-satellite-node-part-2-software-installation-a94a0b85d089) 

  [Building Your Own Bitcoin Satellite Node: Part 3 — Dish Alignment](https://hackernoon.com/building-your-own-bitcoin-satellite-node-part-3-dish-alignment-1306b4c21326) 


## Author

[@Luqina](https://twitter.com/Luqina) 

[@Auriga](https://twitter.com/aurigajp) 

## License

[MIT](http://b4b4r07.mit-license.org)
