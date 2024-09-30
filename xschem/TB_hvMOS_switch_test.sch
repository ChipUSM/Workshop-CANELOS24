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
N 340 -80 370 -80 {
lab=GND}
N 490 -210 530 -210 {
lab=Vg_M1}
N 570 -250 570 -240 {
lab=Vdd}
N 570 -210 590 -210 {
lab=Vdd}
N 590 -250 590 -210 {
lab=Vdd}
N 570 -250 590 -250 {
lab=Vdd}
N 260 -80 300 -80 {
lab=Vg_M2}
N 220 -440 220 -410 {
lab=Vdd}
N 220 -350 220 -330 {
lab=GND}
N 370 -80 370 -40 {
lab=GND}
N 340 -40 370 -40 {
lab=GND}
N 340 -50 340 -40 {
lab=GND}
N 340 -40 340 -20 {
lab=GND}
N 340 -270 340 -250 {
lab=Vdd}
N 310 -440 310 -410 {
lab=Vg_M2}
N 310 -350 310 -330 {
lab=GND}
N 560 -440 560 -410 {
lab=Vg_M1}
N 560 -350 560 -330 {
lab=GND}
N 340 -190 340 -180 {
lab=#net1}
N 340 -120 340 -110 {
lab=Vc2}
N 570 -100 570 -90 {
lab=#net2}
N 570 -170 570 -160 {
lab=Vc1}
N 570 -270 570 -250 {
lab=Vdd}
N 570 -30 570 -20 {
lab=GND}
N 530 -170 570 -170 {
lab=Vc1}
N 570 -180 570 -170 {
lab=Vc1}
N 300 -110 340 -110 {
lab=Vc2}
C {sg13g2_pr/sg13_hv_nmos.sym} 320 -80 2 1 {name=M2
l=\{l_M2\}
w=\{w_M2\}
ng=\{ng_M2\}
m=\{mult_M2\}
model=sg13_hv_nmos
spiceprefix=X
}
C {gnd.sym} 340 -20 0 0 {name=l1 lab=GND}
C {sg13g2_pr/sg13_hv_pmos.sym} 550 -210 0 0 {name=M1
l=\{l_M1\}
w=\{w_M1\}
ng=\{ng_M1\}
m=\{mult_M1\}
model=sg13_hv_pmos
spiceprefix=X
}
C {lab_pin.sym} 260 -80 0 0 {name=p8 sig_type=std_logic lab=Vg_M2}
C {lab_pin.sym} 490 -210 0 0 {name=p1 sig_type=std_logic lab=Vg_M1}
C {vsource.sym} 220 -380 0 0 {name=Vdd value=3 savecurrent=false}
C {lab_pin.sym} 220 -440 0 0 {name=p5 sig_type=std_logic lab=Vdd}
C {gnd.sym} 220 -330 0 0 {name=l2 lab=GND}
C {lab_pin.sym} 570 -270 0 0 {name=p2 sig_type=std_logic lab=Vdd}
C {lab_pin.sym} 340 -270 0 0 {name=p3 sig_type=std_logic lab=Vdd}
C {gnd.sym} 570 -20 0 0 {name=l3 lab=GND}
C {ammeter.sym} 340 -220 0 0 {name=VdM2 savecurrent=true spice_ignore=0}
C {ammeter.sym} 570 -60 0 0 {name=VdM1 savecurrent=true spice_ignore=0}
C {code.sym} -480 -260 0 0 {name=MODEL only_toplevel=true
format="tcleval( @value )"
value="
.lib cornerMOShv.lib mos_tt
"}
C {code.sym} -120 -260 0 0 {name=Simulation_Parameters only_toplevel=false 

value="
.param R = 1.4
.param VH = 3
.param D = 0.5
.param T = 1u
.param dt = 0.1u
.param temp = 27


"}
C {devices/code.sym} -480 -70 0 0 {name=Transient_simulation only_toplevel=false 

value="
.save all
.control
reset
set color0 = white
tran 1n 4u
plot i(VdM1) i(VdM2)
plot v(Vc1) v(Vc2)
plot v(Vg_M1) v(Vg_M2)
.endc

.end
"}
C {vsource.sym} 310 -380 0 0 {name=Vg1 value="PULSE(0 \{VH\} \{dt\} 1n 1n \{T*D-2*dt\} \{T\} 0)" savecurrent=false}
C {lab_pin.sym} 560 -440 0 0 {name=p4 sig_type=std_logic lab=Vg_M1}
C {gnd.sym} 310 -330 0 0 {name=l4 lab=GND}
C {vsource.sym} 560 -380 0 0 {name=Vg2 value="PULSE(0 \{VH\} 0 1n 1n \{T*D\} \{T\} 0)" savecurrent=false}
C {lab_pin.sym} 310 -440 0 0 {name=p6 sig_type=std_logic lab=Vg_M2}
C {gnd.sym} 560 -330 0 0 {name=l5 lab=GND}
C {res.sym} 340 -150 0 0 {name=R1
value=\{R\}
footprint=1206
device=resistor
m=1}
C {res.sym} 570 -130 0 0 {name=R2
value=\{R\}
footprint=1206
device=resistor
m=1}
C {lab_pin.sym} 300 -110 0 0 {name=p7 sig_type=std_logic lab=Vc2}
C {lab_pin.sym} 530 -170 0 0 {name=p9 sig_type=std_logic lab=Vc1}
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
*.param l_M2 =0.25u
.param l_M2 =0.25u
.param ng_M2 =1



"}
