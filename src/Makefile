include ./make/arch.mk

targets	 += main

objs							:= ./main.o
objs							+= ./src/ayla/log.o
objs							+= ./src/ayla/lookup_by_name.o
objs							+= ./src/ayla/timer.o
objs							+= ./src/ayla/time_utils.o
objs							+= ./src/ayla/assert.o
objs							+= ./src/ayla/file_event.o
objs							+= ./src/lockqueue.o
objs							+= ./src/mutex.o
objs							+= ./src/cond.o
objs							+= ./src/list.o


midobjs	:= 
midobjs += $(objs)					$(objs:%.o=%.d) 

include ./make/rules.mk

$(eval $(call LinkApp, main, $(objs)))

scp :
	scp -P 22 ./main root@192.168.10.101:/tmp

startvc :
	(cd ./utils/VirtualCom;\
		./StartVirtualComServer.sh start; \
		cd -; \
	)
stopvc :
	(cd ./utils/VirtualCom;\
		./StartVirtualComServer.sh stop; \
		cd -;\
	)

