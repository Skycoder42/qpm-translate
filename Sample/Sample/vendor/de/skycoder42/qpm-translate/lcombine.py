#!/usr/bin/env python3

import sys
import subprocess
import tempfile
import os

tool = sys.argv[1]
prodir = sys.arg[2]
translations = sys.argv[3:]

filesmap = []

for ts in translations:
	name = os.path.splitext(ts)[0]
	index = name.rindex("_")
	lang = name[index:]
	langlen = len(name) + len(".ts")

	flist = []

	for root, subdirs, files in os.walk(prodir):
		for file in files:
			if file[-langlen:] == lang + ".ts":
				flist.append(os.path.join(root, file))

	filesmap[lang] = flist

for lang, files in filesmap:
	print(lang + files)
