# qpm-translate
A helper repository to easily create translations for QPM modules, without breaking anything

## Features
Allows you to:
- Create ts files for your qpm package
- Create ts files for pro files that use qpm
- Create qm files from ts files of both, a pro file that uses qpm, as well as of all qpm packages.

### Why it is neccessary
You cannot simply use the `TRANSLATIONS` variable in the pri file of your qpm package. The explanation why is simple:
- When running lupdate on the pri-file directly, the correct ts files get created
- When running lupdate on the pro file that includes the pri file, it
	- Overwrites the already created ts files of the pri file
	- Create ts files for the pro files
	- **and** writes translations for **all** sources (both pro and pri) in **all** of those ts files
	
As you can see, this would completly break the existing ts files of a qpm package, and makes it impossible to use lupdate on a project that includes qpm, with having to do the translations yourself. With this script however, it becomes possible.

## Installation
The package is provided as qpm package, [`de.skycoder42.qpm-translate`](https://www.qpm.io/packages/de.skycoder42.qpm-translate/index.html). To install:

1. Install qpm (See [GitHub - Installing](https://github.com/Cutehacks/qpm/blob/master/README.md#installing), for **windows** see below)
2. In your projects root directory, run `qpm install de.skycoder42.qpm-translate`
3. Include qpm to your project by adding `include(vendor/vendor.pri)` to your `.pro` file

Check their [GitHub - Usage for App Developers](https://github.com/Cutehacks/qpm/blob/master/README.md#usage-for-app-developers) to learn more about qpm.

**Important for Windows users:** QPM Version *0.10.0* (the one you can download on the website) is currently broken on windows! It's already fixed in master, but not released yet. Until a newer versions gets released, you can download the latest dev build from here:
- https://storage.googleapis.com/www.qpm.io/download/latest/windows_amd64/qpm.exe
- https://storage.googleapis.com/www.qpm.io/download/latest/windows_386/qpm.exe

## Requirements
In order to use qpm-translate, you need the following installed:
- Python3: A pyhton script is used to do the translations. Thus, you need to have **Python 3** installed!

## Usage
Usage is fairly simple. There are only 2 rules you have to follow:
1. In **QPM Packages**, use `QPM_TRANSLATIONS` instead of `TRANSLATIONS` (Use `TRANSLATIONS` as usual in the pro file that includes the vendor.pri)
2. Instead of running `lupdate|lrealease <options> <file>`, use `qpm-translate lupdate|lrealease <file> <options>`

### Example
#### QPM package
Your qpm packages pri file could contain this:
```.pro
HEADERS += $$PWD/myclass.h
SOURCES += $$PWD/myclass.cpp
QPM_TRANSLATIONS += $$PWD/mypackage_de.ts #instead of TRANSLATIONS += ...
```

After installing this module as dependency, run the following command to create the ts file(s):
```.sh
./vendor/de/skycoder42/qpm-translate/qpm-translate.py lupdate ./com_example_mypackage.pri
```

Now commit the ts file and you can publish your package

#### Using project
In your custom project, that added the mypackage qpm module, you can now have translations as well
```.pro
include(vendor/vendor.pri)

HEADERS += $$PWD/myapp.h
SOURCES += $$PWD/myapp.cpp
TRANSLATIONS += $$PWD/myapp_de.ts
```

To create the translations **without** including the translations of qpm packages (which do already have their ts files), run:
```.sh
./vendor/de/skycoder42/qpm-translate/qpm-translate.py lupdate ./myapp.pro
```

And finally, to generate **all** qm files from all ts files, run:
```.sh
./vendor/de/skycoder42/qpm-translate/qpm-translate.py lrelease ./myapp.pro
```

### Problems
One major problem is, that users without the knowledget how to create the applications will not be able to use your pre-generate translations. However, it will not influence normal lupdate/lrelease runs. They will simply create the ts files specified in the pro file, and all the translations (untranslated) from the qpm sources as well. This means unaware users will not have any problems with you adding this package, but will not use the features as well. Im planning to do some more research, to make it work with simpyl lupdate/lrelease use as well.
