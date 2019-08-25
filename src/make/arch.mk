#ARCH			:= mt7620a
#ARCH			:= x86
ARCH								:= ARMIMX28

#####################################################
ifeq ($(ARCH),mt7620a)
CROSS		:= mipsel-openwrt-linux-
endif

ifeq ($(ARCH),x86)
CROSS		:= 
endif

ifeq ($(ARCH),mt7620a)
SELF_CFLAGS		+= -I./inc -I./product/zwave/inc -I./inc/ayla -I./inc/platform
SELF_LDFLAGS	+= -L./lib
OPENWRT_DIR	:= /home/au/all/gwork/openwrt/
STAGING_DIR		:= $(OPENWRT_DIR)/staging_dir
CROSS_DIR		:= $(STAGING_DIR)/toolchain-mipsel_24kec+dsp_gcc-4.8-linaro_uClibc-0.9.33.2/bin
endif

ifeq ($(ARCH),x86) 
SELF_CFLAGS		+= -I./inc -I./product/zwave/inc -I./inc/ayla
SELF_LDFLAGS	+= -L./lib
OPENWRT_DIR	:= 
STAGING_DIR		:= 
CROSS_DIR		:= 
endif

ifeq ($(ARCH),ARMIMX28)
CROSSTOOLDIR 				:= /home/au/all/opt/gcc-4.4.4-glibc-2.11.1-multilib-1.0/arm-fsl-linux-gnueabi
CROSS   						:= arm-fsl-linux-gnueabi-
export  STAGING_DIR	:= $(CROSSTOOLDIR)/
export  PATH				:= $(PATH):$(STAGING_DIR)/bin

#CROSS_CFLAGS				:= -I$(CROSSTOOLDIR)/staging_dir/toolchain-mipsel_24kec+dsp_gcc-4.8-linaro_uClibc-0.9.33.2/usr/include
CROSS_CFLAGS				+= -I$(CROSSTOOLDIR)/include
#CROSS_LDFLAGS			:= -L$(CROSSTOOLDIR)/staging_dir/toolchain-mipsel_24kec+dsp_gcc-4.8-linaro_uClibc-0.9.33.2/usr/lib
CROSS_LDFLAGS			+= -L$(CROSSTOOLDIR)/lib/ 
endif



SEDONA_HOME	:= /mnt/hgfs/sedona
SEDONABIN_DIR	:= $(SEDONA_HOME)/bin
JAVA_HOME		:= /home/au/all/program/jdk1.8.0_11
export PATH		:= $(PATH):$(CROSS_DIR):$(SEDONABIN_DIR)
export STAGING_DIR
export JAVA_HOME
export CLASSPATH:=.:$(JAVA_HOME)/lib/tools.jar:$(JAVA_HOME)/lib/dt.jar

# tools
CC			:= $(CROSS)gcc
CFLAGS 		:= -Wall -g -O2 -I$./inc -I$./inc/ayla
CFLAGS		+= $(SELF_CFLAGS)

CPP			:= $(CROSS)g++
CPPFLAGS		:= $(CFLAGS)
CPPFLAGS		+= -std=c++0x

LD			:= $(CROSS)g++
#LDFLAGS		:= -lm -lrt -ldl -lpthread
LDFLAGS		:= 
LDFLAGS		+= $(SELF_LDFLAGS)
LDFLAGS		+= -lstdc++

CP			:= cp 
CPFLAGS		:= -rf
RM			:= rm
RMFLAGS		:= -rf

CPPEXT		:= .cpp
CEXT			:= .c
HEXT			:= .h
OEXT			:= .o
COMPILE		:= -c
OUT			:= -o


SEDONACC		:= sedonac.sh
SEDONAOUT		:= -outDir
SCODEEXT		:= .scode
SABEXT		:= .sab
XMLEXT		:= .xml
SAXEXT		:= .sax

STRIP			:= $(CROSS)strip
