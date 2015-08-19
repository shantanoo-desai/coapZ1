all: er-server
# use target "er-plugtest-server" explicitly when requried 

WITH_TMP102_SENSOR=0
CONTIKI=../..

CFLAGS += -DPROJECT_CONF_H=\"project-conf.h\"

# automatically build RESTful resources
REST_RESOURCES_DIR = ./resources
ifndef TARGET
REST_RESOURCES_FILES = $(notdir $(shell find $(REST_RESOURCES_DIR) -name '*.c'))
else
ifeq ($(TARGET), native)
REST_RESOURCES_FILES = $(notdir $(shell find $(REST_RESOURCES_DIR) -name '*.c'))
else
REST_RESOURCES_FILES = $(notdir $(shell find $(REST_RESOURCES_DIR) -name '*.c' ! -name 'res-plugtest*'))
endif
endif

PROJECTDIRS += $(REST_RESOURCES_DIR)
PROJECT_SOURCEFILES += $(REST_RESOURCES_FILES)

# linker optimizations
SMALL=1

# REST Engine shall use Erbium CoAP implementation
APPS += er-coap
APPS += rest-engine


WITH_UIP6=1
UIP_CONF_IPV6=1
#Low Power (Tx) module
LPM_CONF_MAX_PM=1
# IPv6 make config disappeared completely
CFLAGS += -DUIP_CONF_IPV6=1
# variable for Makefile.include
CFLAGS += -DUIP_CONF_IPV6_RPL=1

ifeq ($(WITH_TMP102_SENSOR),1)
CFLAGS += -DWITH_TMP102_SENSOR=1
endif

ifeq ($(WITH_BUTTON_SENSOR),1)
CFLAGS += -DWITH_BUTTON_SENSOR=1
endif

include $(CONTIKI)/Makefile.include