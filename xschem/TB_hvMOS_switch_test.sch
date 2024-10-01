v {xschem version=3.4.5 file_version=1.2
}
G {}
K {type=subcircuit
format="@name @pinlist @symname"
template="name=X1"    }
V {}
S {}
E {}
T {PULSE(VL VH TD TR TF PW PER PHASE) 
} -470 -340 0 0 0.4 0.4 {}
N 260 20 290 20 {
lab=GND}
N 410 -110 450 -110 {
lab=Vg_M1}
N 490 -150 490 -140 {
lab=Vdd}
N 490 -110 510 -110 {
lab=Vdd}
N 510 -150 510 -110 {
lab=Vdd}
N 490 -150 510 -150 {
lab=Vdd}
N 180 20 220 20 {
lab=Vg_M2}
N 590 -340 590 -310 {
lab=Vdd}
N 590 -250 590 -230 {
lab=GND}
N 290 20 290 60 {
lab=GND}
N 260 60 290 60 {
lab=GND}
N 260 50 260 60 {
lab=GND}
N 260 60 260 80 {
lab=GND}
N 260 -170 260 -150 {
lab=Vdd}
N 180 -340 180 -310 {
lab=Vg_M2}
N 180 -250 180 -230 {
lab=GND}
N 180 -490 180 -460 {
lab=Vg_M1}
N 180 -400 180 -380 {
lab=GND}
N 260 -90 260 -80 {
lab=#net1}
N 260 -20 260 -10 {
lab=Vc2}
N 490 0 490 10 {
lab=#net2}
N 490 -70 490 -60 {
lab=Vc1}
N 490 -170 490 -150 {
lab=Vdd}
N 490 70 490 80 {
lab=GND}
N 450 -70 490 -70 {
lab=Vc1}
N 490 -80 490 -70 {
lab=Vc1}
N 220 -10 260 -10 {
lab=Vc2}
C {sg13g2_pr/sg13_hv_nmos.sym} 240 20 2 1 {name=M2
l=\{l_M2\}
w=\{w_M2\}
ng=\{ng_M2\}
m=\{mult_M2\}
model=sg13_hv_nmos
spiceprefix=X
}
C {gnd.sym} 260 80 0 0 {name=l1 lab=GND}
C {sg13g2_pr/sg13_hv_pmos.sym} 470 -110 0 0 {name=M1
l=\{l_M1\}
w=\{w_M1\}
ng=\{ng_M1\}
m=\{mult_M1\}
model=sg13_hv_pmos
spiceprefix=X
}
C {lab_pin.sym} 180 20 0 0 {name=p8 sig_type=std_logic lab=Vg_M2}
C {lab_pin.sym} 410 -110 0 0 {name=p1 sig_type=std_logic lab=Vg_M1}
C {vsource.sym} 590 -280 0 0 {name=Vdd value=\{Vdd\} savecurrent=false}
C {lab_pin.sym} 590 -340 0 0 {name=p5 sig_type=std_logic lab=Vdd}
C {gnd.sym} 590 -230 0 0 {name=l2 lab=GND}
C {lab_pin.sym} 490 -170 0 0 {name=p2 sig_type=std_logic lab=Vdd}
C {lab_pin.sym} 260 -170 0 0 {name=p3 sig_type=std_logic lab=Vdd}
C {gnd.sym} 490 80 0 0 {name=l3 lab=GND}
C {ammeter.sym} 260 -120 0 0 {name=VdM2 savecurrent=true spice_ignore=0}
C {ammeter.sym} 490 40 0 0 {name=VdM1 savecurrent=true spice_ignore=0}
C {code.sym} -480 -260 0 0 {name=MODEL only_toplevel=true
format="tcleval( @value )"
value="
.lib cornerMOShv.lib mos_tt
"}
C {code.sym} -120 -260 0 0 {name=Simulation_Parameters only_toplevel=false 

value="
.param Vdd = 3.3
.param R = 1.4

.param VH = 3.3
.param D = 0.5
.param T = 1u
.param TR = 7n
.param TF = 7n
.param TdR = 0.1u
.param TdF = 0.1u
.param Del = 0.25u
.param temp = 27


"}
C {devices/code.sym} -480 -70 0 0 {name=Transient_simulation only_toplevel=false 

value="
.save all
.control
reset
set color0 = white
tran 1n 1u
let VsdM1 = v(Vdd) - v(Vc1)
let VdsM2 = v(Vc2)
plot i(VdM1) i(VdM2)
plot v(Vc1) v(Vc2)
plot v(Vg_M1) v(Vg_M2)
plot VsdM1 VdsM2
meas TRAN td_off_M1 TRIG v(Vg_M1) VAL=0.33 RISE=1 TARG VsdM1 VAL=0.33 RISE=1
meas TRAN td_on_M1 TRIG v(Vg_M1) VAL=2.97 FALL=1 TARG VsdM1 VAL=2.97 FALL=1
meas TRAN td_on_M2 TRIG v(Vg_M2) VAL=0.33 RISE=1 TARG VdsM2 VAL=2.97 FALL=1
meas TRAN td_off_M2 TRIG v(Vg_M2) VAL=2.97 FALL=1 TARG VdsM2 VAL=0.33 RISE=1
let TdR = td_off_M1 - td_on_M2 
let TdF = td_on_M1 - td_off_M2
print TdR TdF
.endc

.end
"}
C {vsource.sym} 180 -280 0 0 {name=Vg1 value="PULSE(0 \{VH\} \{TdR+Del\} \{1n\} \{1n\} \{T*D-TdR-TdF\} \{T\} 0)" savecurrent=false}
C {lab_pin.sym} 180 -490 0 0 {name=p4 sig_type=std_logic lab=Vg_M1}
C {gnd.sym} 180 -230 0 0 {name=l4 lab=GND}
C {vsource.sym} 180 -430 0 0 {name=Vg2 value="PULSE(0 \{VH\} \{Del\} \{1n\} \{1n\} \{T*D\} \{T\} 0)" savecurrent=false}
C {lab_pin.sym} 180 -340 0 0 {name=p6 sig_type=std_logic lab=Vg_M2}
C {gnd.sym} 180 -380 0 0 {name=l5 lab=GND}
C {res.sym} 260 -50 0 0 {name=R1
value=\{R\}
footprint=1206
device=resistor
m=1}
C {res.sym} 490 -30 0 0 {name=R2
value=\{R\}
footprint=1206
device=resistor
m=1}
C {lab_pin.sym} 220 -10 0 0 {name=p7 sig_type=std_logic lab=Vc2}
C {lab_pin.sym} 450 -70 0 0 {name=p9 sig_type=std_logic lab=Vc1}
C {code.sym} -350 -260 0 0 {name=POWER_MOS_Parameters only_toplevel=false 

value="
.param temp=27
.param mult_M1 = 2400
.param w_M1 =10u 
*.param l_M1 = 0.2u ** Posee mayor capacidad de corriente, pero en sub-umbral conduce mucha corriente
.param l_M1 = 0.22u
.param ng_M1 = 1

.param mult_M2 = 1200
.param w_M2 =10u 
.param l_M2 =0.25u
.param ng_M2 =1



"}
