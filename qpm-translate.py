#!/usr/bin/env python3

import sys
import subprocess
import tempfile
import os

command = sys.argv[1]
target = sys.argv[2]

def trdummy(target):
	file = tempfile.NamedTemporaryFile("w+", prefix=".", suffix=".pro", dir=os.path.dirname(target))
	file.write("include(" + os.path.abspath(target) + ")\n")
	file.write("TRANSLATIONS += $$QPM_TRANSLATIONS\n")
	file.flush()

	return file

if command == "qpm-lupdate":
	with trdummy(target) as file:
		args = sys.argv[3:]
		args.insert(0, "lupdate")
		args.append(file.name)
		subprocess.run(args)
elif command == "lupdate":
	with tempfile.NamedTemporaryFile("w+", prefix=".", suffix=".pro", dir=os.path.dirname(target)) as file:
		with open(target) as orig:
			for line in orig:
				if "vendor.pri" not in line:
					file.write(line)
		file.flush()

		args = sys.argv[3:]
		args.insert(0, "lupdate")
		args.append(file.name)
		subprocess.run(args)
elif command == "lrelease":
	with trdummy(target) as file:
		args = sys.argv[3:]
		args.insert(0, "lrelease")
		args.append(file.name)
		subprocess.run(args)
else:
	print("Usage: qpm-translate.py qpm-lupdate|lupdate|lrelease targetfile [args...]")
