OBJS	= $(CSRCS:.c=.o) $(ASRCS:.S=.o)

GCC	= avr-gcc 
OBJCOPY	= avr-objcopy 
OBJDUMP = avr-objdump
RM      = rm -f 
DUDE    = avrdude

CFLAGS      = -mmcu=$(MCU)
CFLAGS      += -DF_CPU=$(F_CPU)L
CFLAGS      += $(INCUDES)
CFLAGS      += -Os

AFLAGS		= -mmcu=$(MCU)
AFLAGS		+= -x assembler-with-cpp
AFLAGS		+= -DF_CPU=$(F_CPU)L
AFLAGS		+= $(INCLUDES)

LFLAGS		= -v
LFLAGS		+= -p$(MCU) -carduino
LFLAGS		+= -P$(PORT)
LFLAGS		+= -b115200


BASEDIR		= /usr/share/arduino/hardware
INCLUDES	= -I"$(BASEDIR)/arduino/avr/variants/standard"
INCLUDES	+= -I"$(BASEDIR)/tools/avr/avr/include/avr"
DUDECNF     	= -C"$(BASEDIR)/tools/avrdude.conf"

all:	$(TARGET).hex
