DISTFILES += \
	$$PWD/qpm-translate.py

qtPrepareTool(LUPDATE, lupdate)
qtPrepareTool(LRELEASE, lrelease)

qpmlupdate.target = lupdate
qpmlupdate.commands = $$PWD/qpm-translate.py $$shell_quote($$shell_path($$LUPDATE)) $$shell_quote($$shell_path($$_PRO_FILE_)) -locations relative

qpmlrelease.target = lrelease
qpmlrelease.commands = $$PWD/qpm-translate.py $$shell_quote($$shell_path($$LRELEASE)) $$shell_quote($$shell_path($$_PRO_FILE_)) -compress -nounfinished

QMAKE_EXTRA_TARGETS += qpmlupdate qpmlrelease
