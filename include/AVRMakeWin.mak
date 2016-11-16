OBJS	= $(CSRCS:.c=.o) $(ASRCS:.S=.o)

GCC		= avr-gcc
OBJCOPY	= avr-objcopy
OBJDUMP	= avr-objdump
RM		= del
DUDE	= avrdude

CFLAGS		= -mmcu=$(MCU)
CFLAGS		+= -DF_CPU=$(F_CPU)L
CFLAGS		+= $(INCLUDES)
CFLAGS		+= -Os

AFLAGS		= -mmcu=$(MCU)
AFLAGS		+= -x assembler-with-cpp
AFLAGS		+= -DF_CPU=$(F_CPU)L
AFLAGS		+= $(INCLUDES)

LFLAGS		= -v
LFLAGS		+= -p$(MCU) -carduino
LFLAGS		+= -P$(PORT)
LFLAGS		+= -b115200

DUDECNF		= -C"C:\Program Files (x86)\Arduino\hardware\tools\avr\etc\avrdude.conf"
INCLUDES	= -I"C:\Program Files (x86)\Arduino\hardware\arduino\avr\cores\arduino"
INCLUDES	+= -I"C:\Program Files (x86)\Arduino\hardware\arduino\avr\variants\standard"

all:	$(TARGET).hex
