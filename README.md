[![Build Status](https://travis-ci.org/Catethysis/stm32gcc.svg?branch=master)](https://travis-ci.org/Catethysis/stm32gcc)

#stm32gcc
A simple example for stm32 firmware compiling using gcc/Make.
My method is partially based on https://github.com/dwelch67/stm32f4d repo with many changes and additions.

##Build
Just do the following:
```
sudo add-apt-repository -y ppa:team-gcc-arm-embedded/ppa
sudo apt-get update
sudo apt-get install gcc-arm-embedded
make
```

Download firmware from Build/bin/firmware.bin to your STM32F4Discovery from address 0x08000000 using ST-Link Utility (or other tool) and restart it.
You will see led blinking!