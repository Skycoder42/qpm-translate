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
qpmlupdate.commands = $$PWD/qpm-translate.py $$shell_quote($$shell_path($$take_first(LUPDATE))) $$shell_quote($$shell_path($$_PRO_FILE_)) $$LUPDATE

qpmlrelease.target = lrelease
qpmlrelease.commands = $$PWD/qpm-translate.py $$shell_quote($$shell_path($$take_first(LRELEASE))) $$shell_quote($$shell_path($$_PRO_FILE_)) $$LRELEASE

QMAKE_EXTRA_TARGETS += qpmlupdate qpmlrelease
