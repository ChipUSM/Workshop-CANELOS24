v {xschem version=3.4.5 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N -350 -238 -350 -222 {
lab=Vdd}
N -454 -200 -440 -200 {
lab=Vg_M1}
N -454 -160 -440 -160 {
lab=Vg_M2}
N -130 -120 -130 -90 {
lab=Vdd}
N -130 -30 -130 -10 {
lab=GND}
N -410 -120 -410 -90 {
lab=Vg_M1}
N -410 -30 -410 -10 {
lab=GND}
N -410 30 -410 60 {
lab=Vg_M2}
N -410 120 -410 140 {
lab=GND}
N -230 -180 -230 -170 {
lab=Vo}
N -350 -140 -350 -130 {
lab=GND}
N -230 -180 -200 -180 {
lab=Vo}
N -260 -180 -230 -180 {
lab=Vo}
C {/workspaces/usm-vlsi-tools/shared_xserver/simulations/IHP-sg13g2/Simulaciones/Modulos/DCDC_Buck.sym} -340 -160 0 0 {name=X1}
C {lab_pin.sym} -350 -238 0 0 {name=p1 sig_type=std_logic lab=Vdd}
C {lab_pin.sym} -454 -200 0 0 {name=p2 sig_type=std_logic lab=Vg_M1}
C {lab_pin.sym} -454 -160 0 0 {name=p3 sig_type=std_logic lab=Vg_M2}
C {lab_pin.sym} -206 -180 2 0 {name=p4 sig_type=std_logic lab=Vo}
C {code.sym} -1230 -310 0 0 {name=POWER_MOS_Parameters only_toplevel=false 

value="
.param temp=27
*.param mult_M1 = 2400
.param mult_M1 = 3600
.param w_M1 =10u 
*.param l_M1 = 0.2u ** Posee mayor capacidad de corriente, pero en sub-umbral conduce mucha corriente
.param l_M1 = 0.22u
.param ng_M1 = 1

*.param mult_M2 = 1200
.param mult_M2 = 1800
.param w_M2 =10u 
*.param l_M2 =0.25u
.param l_M2 =0.25u
.param ng_M2 =1



"}
C {vsource.sym} -130 -60 0 0 {name=Vdd value=\{Vdd\} savecurrent=false}
C {lab_pin.sym} -130 -120 0 0 {name=p5 sig_type=std_logic lab=Vdd}
C {gnd.sym} -130 -10 0 0 {name=l2 lab=GND}
C {vsource.sym} -410 90 0 0 {name=Vg2 value="PULSE(0 \{VH\} \{dt\} 1n 1n \{T*D-2*dt\} \{T\} 0)" savecurrent=false}
C {lab_pin.sym} -410 -120 0 0 {name=p6 sig_type=std_logic lab=Vg_M1}
C {gnd.sym} -410 -10 0 0 {name=l4 lab=GND}
C {vsource.sym} -410 -60 0 0 {name=Vg1 value="PULSE(0 \{VH\} 0 1n 1n \{T*D\} \{T\} 0)" savecurrent=false}
C {lab_pin.sym} -410 30 0 0 {name=p7 sig_type=std_logic lab=Vg_M2}
C {gnd.sym} -410 140 0 0 {name=l5 lab=GND}
C {code.sym} -780 -310 0 0 {name=Simulation_Parameters only_toplevel=false 

value="
.param Vdd = 3.3
.param VH = 3.3
.param D = 0.42
.param T = 1u
.param dt = 0.1u
*.param dt = 400p
*.param dt = 600p
.param temp = 27


"}
C {devices/code.sym} -1230 -110 0 0 {name=Transient_simulation only_toplevel=false 

value="
.save all


.control
reset
set color0 = white
tran 1n 20u
let Io = i(v.x1.V_Io)
let Po = Io*v(Vo)
meas tran Vo_mean AVG v(Vo) from=10u to=20u
meas tran Io_mean AVG Io from=10u to=20u
meas tran Po_mean AVG Po from=10u to=20u
plot Io i(v.x1.V_IL)
plot v(Vo)
plot Po 
plot v(x1.Vc)
plot v(Vg_M1) v(Vg_M2)
.endc



.end
"}
C {launcher.sym} -840 -100 0 0 {name=h1
descr="Annotate OP" 
tclcommand="set show_hidden_texts 1; xschem annotate_op"
*tclcommand="xschem annotate_op"}
C {code_shown.sym} -1230 -420 0 0 {name=MODEL1 only_toplevel=true
format="tcleval( @value )"
value="
.lib cornerMOShv.lib mos_tt
"}
C {gnd.sym} -350 -130 0 0 {name=l3 lab=GND}
C {code_shown.sym} -971 -309 0 0 {name=RLC_Parameters only_toplevel=false 
value="
*Parametros
*Filtro
.param L = 1.37u
.param R = 0.9
.param C = 416nn

"}
