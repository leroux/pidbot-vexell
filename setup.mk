# Uncomment to redefine locations
VEXELL = ../../vexell
CHIBIOS = $(VEXELL)/../ChibiOS-RT
CONVEX  = $(VEXELL)/../convex/convex/cortex

# uncomment to use the optional code like the smart motor library
CONVEX_OPT  = yes

# User C code files
VEXUSERSRC = $(wildcard src/*.c)

# Uncomment and add/modify user include files
VEXUSERINC = include
