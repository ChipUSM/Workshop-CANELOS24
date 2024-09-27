export DESIGN_NICKNAME = mac_8
export DESIGN_NAME = grid
export PLATFORM    = ihp-sg13g2

export VERILOG_FILES =  $(DESIGN_HOME)/src/$(DESIGN_NICKNAME)/grid.v \
                        $(DESIGN_HOME)/src/$(DESIGN_NICKNAME)/neuron_wxor.v \
                        $(DESIGN_HOME)/src/$(DESIGN_NICKNAME)/tac_signed_wxor.v \
                        $(DESIGN_HOME)/src/$(DESIGN_NICKNAME)/relu.v \
                        $(DESIGN_HOME)/src/$(DESIGN_NICKNAME)/bias_and_quantize.v \
                        $(DESIGN_HOME)/src/$(DESIGN_NICKNAME)/dtc_wabs.v \
                        $(DESIGN_HOME)/src/$(DESIGN_NICKNAME)/dtc.v \
                        $(DESIGN_HOME)/src/$(DESIGN_NICKNAME)/abs_dtc.v


export SDC_FILE      = $(DESIGN_HOME)/$(PLATFORM)/$(DESIGN_NICKNAME)/constraint.sdc

export CORE_UTILIZATION = 40
export PLACE_DENSITY = 0.88
export TNS_END_PERCENT = 100

export SYNTH_MEMORY_MAX_BITS = 16384

# Allow routing on the TopMetal layers, for the padring connections
export MAX_ROUTING_LAYER = TopMetal2

export CDL_FILE = \
    $(IHP_PDK_ROOT)/$(PDK)/libs.ref/sg13g2_stdcell/cdl/sg13g2_stdcell.cdl