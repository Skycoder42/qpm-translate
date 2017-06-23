isEmpty(LUPDATE) {
	qtPrepareTool(LUPDATE, lupdate)
	LUPDATE += -locations relative
}
isEmpty(LRELEASE) {
	qtPrepareTool(LRELEASE, lrelease)
	LRELEASE += -compress -nounfinished
}

helperpro.target = qpm-helperpro
helperpro.commands = echo $$shell_quote(include($(QPM_PRI))) > .trhelper.pro && echo $$shell_quote(TRANSLATIONS += \$\$\$\$QPM_TRANSLATIONS) >> .trhelper.pro

qpmlupdate.target = qpm-lupdate
qpmlupdate.commands = $$LUPDATE .trhelper.pro
qpmlupdate.depends += qpm-helperpro

qpmlrelease.target = qpm-lrelease
qpmlrelease.commands = $$LRELEASE .trhelper.pro
qpmlrelease.depends += qpm-helperpro

QMAKE_EXTRA_TARGETS += helperpro qpmlupdate qpmlrelease
