export DESIGN_NICKNAME = spi
export DESIGN_NAME = spi
export PLATFORM    = ihp-sg13g2

export VERILOG_FILES =  $(DESIGN_HOME)/src/$(DESIGN_NICKNAME)/spi.v
export SDC_FILE      = $(DESIGN_HOME)/$(PLATFORM)/$(DESIGN_NICKNAME)/constraint.sdc

export CORE_UTILIZATION = 20
export PLACE_DENSITY = 0.88
export TNS_END_PERCENT = 100

export SYNTH_MEMORY_MAX_BITS = 16384

# Allow routing on the TopMetal layers, for the padring connections
export MAX_ROUTING_LAYER = TopMetal2

export CDL_FILE = \
    $(IHP_PDK_ROOT)/$(PDK)/libs.ref/sg13g2_stdcell/cdl/sg13g2_stdcell.cdl