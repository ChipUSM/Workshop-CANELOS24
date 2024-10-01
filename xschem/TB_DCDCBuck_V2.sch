v {xschem version=3.4.5 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N -660 -30 -660 0 {
lab=Vdd}
N -660 60 -660 80 {
lab=GND}
N -940 -30 -940 0 {
lab=Vg_M1}
N -940 60 -940 80 {
lab=GND}
N -940 120 -940 150 {
lab=Vg_M2}
N -940 210 -940 230 {
lab=GND}
N -380 -145 -380 -100 {
lab=Vc}
N -380 -15 -380 35 {
lab=GND}
N -360 -15 -90 -15 {
lab=GND}
N -380 -25 -380 -15 {
lab=GND}
N -380 -215 -380 -205 {
lab=Vdd}
N -420 -100 -380 -100 {
lab=Vc}
N -180 -95 -170 -95 {
lab=#net1}
N -380 -95 -380 -85 {
lab=Vc}
N -380 -95 -360 -95 {
lab=Vc}
N -380 -100 -380 -95 {
lab=Vc}
N -300 -95 -280 -95 {
lab=#net2}
N -380 -175 -360 -175 {
lab=Vdd}
N -360 -215 -360 -175 {
lab=Vdd}
N -380 -215 -360 -215 {
lab=Vdd}
N -380 -55 -360 -55 {
lab=GND}
N -360 -55 -360 -15 {
lab=GND}
N -380 -15 -360 -15 {
lab=GND}
N -90 -25 -90 -15 {
lab=GND}
N -90 -95 -90 -85 {
lab=Vo}
N -110 -95 -90 -95 {
lab=Vo}
N -180 -95 -180 -75 {
lab=#net1}
N -220 -95 -180 -95 {
lab=#net1}
N -460 -175 -420 -175 {
lab=Vg_M1}
N -450 -55 -420 -55 {
lab=Vg_M2}
N -380 -245 -380 -215 {
lab=Vdd}
N -90 -110 -90 -95 {
lab=Vo}
C {lab_pin.sym} -380 -243 0 0 {name=p1 sig_type=std_logic lab=Vdd}
C {lab_pin.sym} -459 -175 0 0 {name=p2 sig_type=std_logic lab=Vg_M1}
C {lab_pin.sym} -449 -55 0 0 {name=p3 sig_type=std_logic lab=Vg_M2}
C {code_shown.sym} -986 -304 0 0 {name=RLC_Parameters only_toplevel=false 
value="
*Parametros
*Filtro
.param L = 1.37u
.param R = 0.9
.param C = 416n

"}
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
C {vsource.sym} -660 30 0 0 {name=Vdd value=3.3 savecurrent=false}
C {lab_pin.sym} -660 -30 0 0 {name=p5 sig_type=std_logic lab=Vdd}
C {gnd.sym} -660 80 0 0 {name=l2 lab=GND}
C {vsource.sym} -940 180 0 0 {name=Vg2 value="PULSE(0 \{VH\} \{dt\} 1n 1n \{T*D-2*dt\} \{T\} 0)" savecurrent=false}
C {lab_pin.sym} -940 -30 0 0 {name=p6 sig_type=std_logic lab=Vg_M1}
C {gnd.sym} -940 80 0 0 {name=l4 lab=GND}
C {vsource.sym} -940 30 0 0 {name=Vg1 value="PULSE(0 \{VH\} 0 1n 1n \{T*D\} \{T\} 0)" savecurrent=false}
C {lab_pin.sym} -940 120 0 0 {name=p7 sig_type=std_logic lab=Vg_M2}
C {gnd.sym} -940 230 0 0 {name=l5 lab=GND}
C {code.sym} -780 -310 0 0 {name=Simulation_Parameters only_toplevel=false 

value="

.param VH = 3
.param D = 0.42
.param T = 1u
.param dt = 5n
.param temp = 27


"}
C {devices/code.sym} -1230 -110 0 0 {name=Transient_simulation only_toplevel=false 

value="
.save all
.control
reset
set color0 = white
tran 1n 100u
plot i(V_Io) i(V_IL)
plot v(Vo) 
plot v(Vc)
plot v(Vg_M1) v(Vg_M2)
.endc

.end
"}
C {launcher.sym} -810 -120 0 0 {name=h1
descr="Annotate OP" 
tclcommand="set show_hidden_texts 1; xschem annotate_op"
*tclcommand="xschem annotate_op"}
C {code_shown.sym} -1230 -420 0 0 {name=MODEL1 only_toplevel=true
format="tcleval( @value )"
value="
.lib cornerMOShv.lib mos_tt
"}
C {sg13g2_pr/sg13_hv_nmos.sym} -400 -55 2 1 {name=M2
l=\{l_M2\}
w=\{w_M2\}
ng=\{ng_M2\}
m=\{mult_M2\}
model=sg13_hv_nmos
spiceprefix=X
}
C {sg13g2_pr/sg13_hv_pmos.sym} -400 -175 0 0 {name=M1
l=\{l_M1\}
w=\{w_M1\}
ng=\{ng_M1\}
m=\{mult_M1\}
model=sg13_hv_pmos
spiceprefix=X
}
C {ind.sym} -250 -95 3 1 {name=L6
m=1
value=\{L\}
footprint=1206
device=inductor}
C {capa.sym} -180 -45 0 0 {name=C1
m=1
value=\{C\}
footprint=1206
device="ceramic capacitor"}
C {ammeter.sym} -140 -95 3 0 {name=V_Io savecurrent=true spice_ignore=0}
C {ammeter.sym} -330 -95 3 0 {name=V_IL savecurrent=true spice_ignore=0}
C {res.sym} -90 -55 0 0 {name=R2
value=\{R\}
footprint=1206
device=resistor
m=1}
C {gnd.sym} -380 30 0 0 {name=l1 lab=GND}
C {lab_pin.sym} -90 -108 0 1 {name=p4 sig_type=std_logic lab=Vo}
C {lab_pin.sym} -419 -100 0 0 {name=p8 sig_type=std_logic lab=Vc}
