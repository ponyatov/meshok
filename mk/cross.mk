HW ?= pc
# HW ?= f429disco
# HW ?= pi800
# HW ?= esp32

include   hw/$(HW)/$(HW).mk
include  cpu/$(CPU)/$(CPU).mk
include arch/$(ARCH)/$(ARCH).mk
include   os/$(OS)/$(OS).mk
