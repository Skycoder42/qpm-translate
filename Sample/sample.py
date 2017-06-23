#!/usr/bin/env python3

import subprocess

#As a qpm-developer, create ts files for translations in QPM_TRANSLATIONS
subprocess.run([
	"../qpm-translate.py",
	"lupdate",
	"./dummy.pri"
]);

#As a qpm-user, create ts files for your project, skipping sources of qpm packages
subprocess.run([
	"../qpm-translate.py",
	"lupdate",
	"./Sample.pro"
]);

#As a qpm-user, generate all qm files from all ts files (custom and qpm packages)
subprocess.run([
	"../qpm-translate.py",
	"lrelease",
	"./Sample.pro"
]);

