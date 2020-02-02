:globe_with_meridians:  **<u>english</u>**    |   [český](README.cz.md)    |   [русский](README.ru.md)

# FLRO

FLR Optimizer is a AWK-based script for optimizing JSON formatted FLR files ([exported from Rive](https://rive.app)). This experimental script was greatly influenced by the [SVGO](https://github.com/svg/svgo) project. Please don't take it too seriously. :relaxed:

![Screenshot](screenshot.png)

## Why?
FLR files, especially those exported in JSON format, usually contain a lot of useless information. Such as non-optimal, too long values and so on, that can be safely converted without affecting the FLR rendering result much.

## Where?
AWK is a domain-specific language designed for text processing and typically used as a data extraction and reporting tool. **It is a standard feature of most Unix-like operating systems, such as macOS and Linux distributions.**
> **Note about Windows:** AWK is not available in Windows by default. Please use either [*gawk*](http://gnuwin32.sourceforge.net/packages/gawk.htm) (you will need to change the command syntax a little) or in Windows 10 (from build 14328 and later), simply run a command from [*Linux Bash Shell*](https://docs.microsoft.com/en-us/windows/wsl/install-win10) *(i have personally tested it there too).*

## Usage

In terminal navigate to folder with your FLR file and run following command:
````markdown
awk '{
    while (match($0, /[0-9]+\.[0-9]+/)) {
        printf "%s%.2f", substr($0, 1, RSTART-1), substr($0, RSTART, RLENGTH)
        $0 = substr($0, RSTART+RLENGTH)
    }
    print
}' original.flr > optimized.flr
````
#### Parameters:
* **2**f is the number of digits after the decimal point *(I do not recommend reducing it below 2)*.
* **original.flr** is the name of your FLR file.
* **optimized.flr** is the name of optimized FLR file.

## Showcase in Flutter
The FLR file from the [assets](./assets) folder, in this repository, was optimized by this script. To test results of this script — please run following commands in terminal:
````markdown
flutter upgrade
git clone https://github.com/tsinis/flro.git
cd flro
flutter create .
flutter run
````

## License and Copyright
This project is released under the terms of the [MIT license](./LICENSE).