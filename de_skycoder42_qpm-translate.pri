DISTFILES += \
	$$PWD/qpm-translate.py

isEmpty(LUPDATE) {
	qtPrepareTool(LUPDATE, lupdate)
	LUPDATE += -locations relative
}
isEmpty(LRELEASE) {
	qtPrepareTool(LRELEASE, lrelease)
	LRELEASE += -compress -nounfinished
}

qpmlupdate.target = lupdate
qpmlupdate.commands = $$shell_quote($$shell_path($$PWD/qpm-translate.py)) $$shell_quote($$shell_path($$take_first(LUPDATE))) $$shell_quote($$shell_path($$_PRO_FILE_)) $$LUPDATE
else:win32: qpmlupdate.commands = python $$qpmlupdate.commands
else:mac: qpmlupdate.commands = python $$qpmlupdate.commands

qpmlrelease.target = lrelease
qpmlrelease.commands = $$shell_quote($$shell_path($$PWD/qpm-translate.py)) $$shell_quote($$shell_path($$take_first(LRELEASE))) $$shell_quote($$shell_path($$_PRO_FILE_)) $$LRELEASE
else:win32: qpmlrelease.commands = python qpmlrelease.commands
else:mac: qpmlrelease.commands = python qpmlrelease.commands

QMAKE_EXTRA_TARGETS += qpmlupdate qpmlrelease
