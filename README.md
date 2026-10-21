# CP2112-Laptop-Battery-Reader

## Building on Linux

Requires a C++ compiler, make, Qt 5 Widgets development tools (including qmake),
pkg-config, and libusb 1.0 development files. On Debian/Ubuntu:

```sh
sudo apt install build-essential qtbase5-dev qt5-qmake pkg-config libusb-1.0-0-dev
```

Obtain the Silicon Labs USBXpress Host SDK for Linux and copy both
`libslabhidtosmbus.a` and `libslabhiddevice.a` from its
`CP2112/lib/<architecture>/` directory into `Library/Linux/lib/`.
Use libraries matching your target architecture. These files are ignored by git.
Alternatively, pass `SILABS_LIBDIR=/path/to/sdk/CP2112/lib/x86_64` to qmake.

The x86-64 build was verified using the SDK libraries mirrored at
[mschuldt/_efm8](https://github.com/mschuldt/_efm8/tree/56d116793833e9be86355a63bc9675489f6c2e38/USBXpressHostSDK/CP2112)
(commit `56d116793833e9be86355a63bc9675489f6c2e38`).

```sh
mkdir -p build-linux
cd build-linux
qmake ../CP2112-Laptop-Battery-Reader.pro
make -j"$(nproc)"
./CP2112-Laptop-Battery-Reader
```

The vendor libraries are linked statically; Qt and libusb are runtime dependencies.
Access to the CP2112 USB device requires appropriate USB device permissions.

## About

This simple program shows all the parameters of your battery within the Smart Battery Data Specification Revision 1.1<br />
And also some other parameters. Namely, viewing the voltage on each battery cell. Although they are undocumented in this specification, many manufacturers use them.<br />

![Screenshot](https://user-images.githubusercontent.com/17345244/148661589-7d64b022-5c16-4cd5-8fc0-1e56cbf41381.jpg)

I am using <a title="download" href="https://www.qt.io/product/development-tools" target="_blank">Qt Creator 6.0.1</a> <br />
You can examine my bad code and make your changes. <br />
Or, if you are lazy and everything suits you, download the finished release. After you unzip the zip file to a convenient location, run the exe file.<br />
<p>In order to connect to the battery, you will need a small board on the cp2112 chip. There are a lot of them on the Internet, on ebay, aliexpress, and possibly in a radio parts store near you. They are inexpensive, a few dollars.</p>

![cp2112](https://user-images.githubusercontent.com/17345244/148701376-6269510e-795b-49de-9681-04b7a7ec95bf.png)

However, if you would like to delve deeper into this topic, you may be interested in purchasing an <a title="evaluation kit" href="https://www.silabs.com/interface/usb-bridges/classic/device.cp2112" target="_blank">evaluation kit</a>.

![cp2112ek](https://user-images.githubusercontent.com/17345244/148701959-6c730b6e-8f6e-4a66-92cf-d548e4dfa904.png)

I'll tell you a secret that in some cases you can get it for free. For example, for a programming classroom in your school. I only beg you, do not ask me about the details, I do not know these subtleties<br />
And finally you need to connect GND, SDA and SСL to your battery. Be careful! Never connect these contacts to the positive terminal of the battery.
