###############################################################
# Synopsys Design Compiler Synthesis Script for LX100RTL
# Target: TSMC 28HPC+ CCS
# Goal: 1 GHz (1.0 ns) synthesis
###############################################################

#===============================
# Project configuration
#===============================
set clock_name  "clk"
set reset_name  "rst"
set CLK_PERIOD  1.0   ;# <-- 1 GHz target

#===============================
# Library setup
#===============================
set search_path [list \
    "./" \
    "/afs/eecs.umich.edu/kits/TSMC/N28HPC+/2018.10/tcbn28hpcplusbwp30p140/digital/Front_End/timing_power_noise/CCS/tcbn28hpcplusbwp30p140_180a/" \
]

# choose a typical corner (example: tt,0.9V,25C)
set target_library "tcbn28hpcplusbwp30p140tt0p9v25c_ccs.db"
set link_library   [concat "*" $target_library]

#/***********************************************************/
#/* Set some flags to suppress warnings we don't care about */
set suppress_errors [concat $suppress_errors "UID-401"]
suppress_message {"VER-130"}

proc synthesize_one {block_name vhdl_files out_dir} {
    file mkdir "/home/akashpt/LX100RTL/synth/${block_name}"
    puts "\n===================================================" 
    puts " Synthesizing block: $block_name" 
    puts "===================================================\n"
    read_file -format vhdl $vhdl_files
    current_design topEntity

    #===============================
    # Constraints
    #===============================
    global CLK_PERIOD clock_name reset_name
    #===========================================================
    # Improved, accurate constraints for VHDL synthesis (1 GHz)
    #===========================================================

    # Clock definition (1 GHz)
    create_clock -period $CLK_PERIOD -name $clock_name [get_ports $clock_name]

    # Clock uncertainty (for skew + jitter)
    set_clock_uncertainty 0.05 [get_clocks $clock_name]

    # Input / Output delays (you can tune these)
    set_input_delay  0.10 -clock $clock_name [remove_from_collection [all_inputs] [get_ports $clock_name]]
    set_output_delay 0.10 -clock $clock_name [all_outputs]

    # Allow DC to manage the reset, but don’t optimize it away
    if {[sizeof_collection [get_ports $reset_name]] > 0} {
        set_dont_touch [get_ports $reset_name]
    }

    # Driving cell behavior (old: dffacs1)
    # More accurate replacement for 28HPC+:
    set_driving_cell -lib_cell DFFHQX1 [all_inputs]

    # Load on outputs
    set_load 0.05 [all_outputs]

    # Max transition allowed on nets
    set_max_transition 0.08 [current_design]

    # Max fanout allowed
    set_max_fanout 20 [current_design]

    # Critical range (old was 1.0)
    set_critical_range 0.10 [current_design]

    # Group input/output paths for reporting clarity
    group_path -name INPUTS  -from [all_inputs]
    group_path -name OUTPUTS -to   [all_outputs]

    # Fanout load (old value was 10)
    set_fanout_load 0.10 [all_outputs]

    #===============
    # Additional DC fixes
    #===============
    set_fix_multiple_port_nets -all -buffer_constants
    uniquify
    check_design

    #===============
    # Compile
    #===============
    compile_ultra -no_autoungroup -gate_clock -retime

    #===============================
    # Reports
    #===============================
    report_timing  -max_paths 10  > synth/${block_name}/timing.rpt
    report_area                     > synth/${block_name}/area.rpt
    report_power                    > synth/${block_name}/power.rpt
    report_design                   > synth/${block_name}/design.rpt

    #===============================
    # Write final outputs
    #===============================
    write -format verilog -hierarchy -output synth/${block_name}/topEntity.v
    write -format ddc               -output synth/${block_name}/topEntity.ddc
}

# RequestGenerator1
synthesize_one \
    RequestGenerator1 \
    [list \
    "ReqGen/vhdl/RequestGenerator.topEntity/topEntity.vhdl" \
    "ReqGen/vhdl/RequestGenerator.topEntity/RequestGenerator_topEntity_types.vhdl" \
    ] \
    "/home/akashpt/LX100RTL/synth/RequestGenerator.topEntity"

# hotvectororoperation (HotVectorOr) 
synthesize_one \
    hotvectororoperation \
    [list \
        "/home/akashpt/LX100RTL/ReqGen/vhdl/HotVectorOr.topEntity/topEntity.vhdl" \
        "/home/akashpt/LX100RTL/ReqGen/vhdl/HotVectorOr.topEntity/HotVectorOr_topEntity_types.vhdl" \
    ] \
    "/home/akashpt/LX100RTL/synth/HotVectorOr.topEntity"

# addressdecoder (AddrDecoderTop)
synthesize_one \
    addressdecoder \
    [list \
        "/home/akashpt/LX100RTL/ReqGen/vhdl/AddrDecoderTop.topEntity/topEntity.vhdl" \
        "/home/akashpt/LX100RTL/ReqGen/vhdl/AddrDecoderTop.topEntity/AddrDecoderTop_topEntity_types.vhdl" \
    ] \
    "/home/akashpt/LX100RTL/synth/addressdecoder"

# columnencoder (ColumnEncoder)
synthesize_one \
    columnencoder \
    [list \
        "/home/akashpt/LX100RTL/ReqGen/vhdl/AddColumnEncoderrDecoderTop.topEntity/topEntity.vhdl" \
        "/home/akashpt/LX100RTL/ReqGen/vhdl/ColumnEncoder.topEntity/ColumnEncoder_topEntity_types.vhdl" \
    ] \
    "/home/akashpt/LX100RTL/synth/columnencoder"

# addresscreator (AddrGeneratorTop)
synthesize_one \
    addresscreator \
    [list \
        "/home/akashpt/LX100RTL/ReqGen/vhdl/AddrGeneratorTop.topEntity/topEntity.vhdl" \
        "/home/akashpt/LX100RTL/ReqGen/vhdl/AddrGeneratorTop.topEntity/AddrGeneratorTop_topEntity_types.vhdl" \
    ] \
    "/home/akashpt/LX100RTL/synth/addresscreator"


# ColumnOffsetDecoderArea
synthesize_one \
    ColumnOffsetDecoderArea \
    [list \
        "/home/akashpt/LX100RTL/ColumnDecoder/vhdl/ColumnOffsetDecoderArea.topEntity/topEntity.vhdl" \
        "/home/akashpt/LX100RTL/ColumnDecoder/vhdl/ColumnOffsetDecoderArea.topEntity/ColumnOffsetDecoderArea_topEntity_types.vhdl" \
    ] \
    "/home/akashpt/LX100RTL/synth/ColumnOffsetDecoderArea.topEntity"


# ColumnOffsetDecoderBaseline
synthesize_one \
    ColumnOffsetDecoderBaseline \
    [list \
        "/home/akashpt/LX100RTL/ColumnDecoder/vhdl/ColumnOffsetDecoderBaseline.topEntity/topEntity.vhdl" \
        "/home/akashpt/LX100RTL/ColumnDecoder/vhdl/ColumnOffsetDecoderBaseline.topEntity/ColumnOffsetDecoderBaseline_topEntity_types.vhdl" \
    ] \
    "/home/akashpt/LX100RTL/synth/ColumnOffsetDecoderBaseline.topEntity"


# ColumnOffsetDecoderFrequency
synthesize_one \
    ColumnOffsetDecoderFrequency \
    [list \
        "/home/akashpt/LX100RTL/ColumnDecoder/vhdl/ColumnOffsetDecoderFrequency.topEntity/topEntity.vhdl" \
        "/home/akashpt/LX100RTL/ColumnDecoder/vhdl/ColumnOffsetDecoderFrequency.topEntity/ColumnOffsetDecoderFrequency_topEntity_types.vhdl" \
    ] \
    "/home/akashpt/LX100RTL/synth/ColumnOffsetDecoderFrequency.topEntity"

quit
