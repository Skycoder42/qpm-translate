DISTFILES += \
	$$PWD/qpm-translate.py \
	$$PWD/lcombine.py

isEmpty(LUPDATE) {
	qtPrepareTool(LUPDATE, lupdate)
	LUPDATE += -locations relative
}
isEmpty(LRELEASE) {
	qtPrepareTool(LRELEASE, lrelease)
	LRELEASE += -compress -nounfinished
}
isEmpty(LCONVERT): qtPrepareTool(LRELEASE, lconvert)

qpmlupdate.target = lupdate
qpmlupdate.commands = $$shell_quote($$shell_path($$PWD/qpm-translate.py)) $$shell_quote($$shell_path($$take_first(LUPDATE))) $$shell_quote($$shell_path($$_PRO_FILE_)) $$LUPDATE
win32: qpmlupdate.commands = python $$qpmlupdate.commands
else:mac: qpmlupdate.commands = /usr/local/bin/python3 $$qpmlupdate.commands

qpmlrelease.target = lrelease
qpmlrelease.commands = $$shell_quote($$shell_path($$PWD/qpm-translate.py)) $$shell_quote($$shell_path($$take_first(LRELEASE))) $$shell_quote($$shell_path($$_PRO_FILE_)) $$LRELEASE
win32: qpmlrelease.commands = python $$qpmlrelease.commands
else:mac: qpmlrelease.commands = /usr/local/bin/python3 $$qpmlrelease.commands

#qpmlcombine.target = lcombine
#qpmlcombine.commands = $$shell_quote($$shell_path($$PWD/lcombine.py)) $$shell_quote($$shell_path($$take_first(LCONVERT))) $$shell_quote($$shell_path($$_PRO_FILE_PWD_)) $$TRANSLATIONS
#win32: qpmlcombine.commands = python $$qpmlcombine.commands
#else:mac: qpmlcombine.commands = /usr/local/bin/python3 $$qpmlcombine.commands

QMAKE_EXTRA_TARGETS += qpmlupdate qpmlrelease #qpmlcombine
