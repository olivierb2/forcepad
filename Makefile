obj-m              += psmouse-new.o

psmouse-new-objs   :=
psmouse-new-objs   += psmouse-base.o
psmouse-new-objs   += alps.o
psmouse-new-objs   += cypress_ps2.o
psmouse-new-objs   += elantech.o
#psmouse-new-objs   += hgpk.o
psmouse-new-objs   += lifebook.o
psmouse-new-objs   += logips2pp.o
psmouse-new-objs   += sentelic.o
psmouse-new-objs   += synaptics.o
psmouse-new-objs   += touchkit_ps2.o
psmouse-new-objs   += trackpoint.o

ifeq ($(KVER),)
	KVER = $(shell uname -r)
endif

KBASE              ?= /lib/modules/$(KVER)
KBUILD_DIR         ?= $(KBASE)/build
MDEST_DIR          ?= $(KBASE)/kernel/drivers/input/mouse
PWD                ?= $(shell pwd)

all:
	KBUILD_NOPEDANTIC=1 make -C $(KBUILD_DIR) M=$(PWD)

clean:
	KBUILD_NOPEDANTIC=1 make -C $(KBUILD_DIR) M=$(PWD) clean

install:
	install -D -m 755 psmouse-new.ko $(MDEST_DIR)

