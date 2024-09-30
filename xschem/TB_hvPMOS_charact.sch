v {xschem version=3.4.5 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
T {l_min = 0.13u
w_max = 10u; w_min_HVnmos = 0.45u; w_min_HVpmos = 0.4u;} -1190 -500 0 0 0.4 0.4 {}
N -750 -300 -750 -260 {
lab=GND}
N -750 -390 -750 -360 {
lab=Vg}
N -670 -390 -670 -360 {
lab=Vd}
N -670 -300 -670 -260 {
lab=GND}
N -750 -260 -670 -260 {
lab=GND}
N -750 -260 -750 -240 {
lab=GND}
N -800 -30 -760 -30 {
lab=Vg}
N -720 0 -720 40 {
lab=Vd}
N -600 -300 -600 -260 {
lab=GND}
N -670 -260 -600 -260 {
lab=GND}
N -600 -390 -600 -360 {
lab=Vdd}
N -720 -70 -720 -60 {
lab=#net1}
N -720 -30 -700 -30 {
lab=#net1}
N -700 -70 -700 -30 {
lab=#net1}
N -720 -70 -700 -70 {
lab=#net1}
N -720 -90 -720 -70 {
lab=#net1}
N -580 -30 -540 -30 {
lab=Vg}
N -500 0 -500 40 {
lab=Vd}
N -500 -70 -500 -60 {
lab=#net2}
N -500 -30 -480 -30 {
lab=#net2}
N -480 -70 -480 -30 {
lab=#net2}
N -500 -70 -480 -70 {
lab=#net2}
N -500 -90 -500 -70 {
lab=#net2}
N -350 -30 -310 -30 {
lab=Vg}
N -270 0 -270 40 {
lab=Vd}
N -270 -70 -270 -60 {
lab=#net3}
N -270 -30 -250 -30 {
lab=#net3}
N -250 -70 -250 -30 {
lab=#net3}
N -270 -70 -250 -70 {
lab=#net3}
N -270 -90 -270 -70 {
lab=#net3}
C {sg13g2_pr/sg13_hv_pmos.sym} -740 -30 0 0 {name=M1
l=\{l_M1\}
w=\{w_M1\}
ng=1
m=\{mult_M1\}
model=sg13_hv_pmos
spiceprefix=X
}
C {lab_pin.sym} -720 40 0 0 {name=p2 sig_type=std_logic lab=Vd}
C {lab_pin.sym} -800 -30 0 0 {name=p3 sig_type=std_logic lab=Vg}
C {vsource.sym} -750 -330 0 0 {name=Vgs value=1.5 savecurrent=false}
C {vsource.sym} -670 -330 0 0 {name=Vds value=3 savecurrent=false}
C {lab_pin.sym} -670 -390 0 0 {name=p1 sig_type=std_logic lab=Vd}
C {lab_pin.sym} -750 -390 0 0 {name=p4 sig_type=std_logic lab=Vg}
C {gnd.sym} -750 -240 0 0 {name=l2 lab=GND}
C {code_shown.sym} -1190 -300 0 0 {name=Simulation only_toplevel=false 

value="
.param temp=27
.param mult_M1 = 1200
.param w_M1 =10u 
*.param l_M1 =0.25u
.param l_M1 =0.2u

.param mult_M2 = 1200
.param w_M2 =10u 
.param l_M2 =0.13u
*.param l_M2 =0.2u

.param mult_M3 = 1200
.param w_M3 =10u 
.param l_M3 =0.35u

.save all
* + @M.XM1.m1[id]
+ @n.xm1.nsg13_hv_pmos[vth]
+ @n.xm2.nsg13_hv_pmos[vth]
+ @n.xm3.nsg13_hv_pmos[vth]

.control 
dc Vds 0 3.3 0.01 Vgs 0.5 3.3 0.5
*dc Vds 0 0.5 0.01 temp 0 27 1

plot i(VdM1) i(VdM2) i(VdM3)
plot i(VdM1) i(VdM2)

print @n.xm1.nsg13_hv_pmos[vth] @n.xm2.nsg13_hv_pmos[vth] @n.xm3.nsg13_hv_pmos[vth]
*print @n.xm2.nsg13_hv_nmos[vth]
write test_pmos.raw
.endc


.control
reset
alter Vds 0 
dc Vgs 2 3.3 0.01 
plot i(VdM1) i(VdM2) i(VdM3)
.endc

"}
C {code_shown.sym} -1190 -410 0 0 {name=MODEL only_toplevel=true
format="tcleval( @value )"
value="
.lib cornerMOShv.lib mos_tt
"}
C {vsource.sym} -600 -330 0 0 {name=Vdd value=3.3 savecurrent=false}
C {lab_pin.sym} -600 -390 0 0 {name=p5 sig_type=std_logic lab=Vdd}
C {lab_pin.sym} -720 -150 0 0 {name=p6 sig_type=std_logic lab=Vdd}
C {ammeter.sym} -720 -120 0 0 {name=VdM1 savecurrent=true spice_ignore=0}
C {sg13g2_pr/sg13_hv_pmos.sym} -520 -30 0 0 {name=M2
l=\{l_M2\}
w=\{w_M2\}
ng=1
m=\{mult_M2\}
model=sg13_hv_pmos
spiceprefix=X
}
C {lab_pin.sym} -500 40 0 0 {name=p7 sig_type=std_logic lab=Vd}
C {lab_pin.sym} -580 -30 0 0 {name=p8 sig_type=std_logic lab=Vg}
C {lab_pin.sym} -500 -150 0 0 {name=p9 sig_type=std_logic lab=Vdd}
C {ammeter.sym} -500 -120 0 0 {name=VdM2 savecurrent=true spice_ignore=0}
C {sg13g2_pr/sg13_hv_pmos.sym} -290 -30 0 0 {name=M3
l=\{l_M3\}
w=\{w_M3\}
ng=1
m=\{mult_M3\}
model=sg13_hv_pmos
spiceprefix=X
}
C {lab_pin.sym} -270 40 0 0 {name=p10 sig_type=std_logic lab=Vd}
C {lab_pin.sym} -350 -30 0 0 {name=p11 sig_type=std_logic lab=Vg}
C {lab_pin.sym} -270 -150 0 0 {name=p12 sig_type=std_logic lab=Vdd}
C {ammeter.sym} -270 -120 0 0 {name=VdM3 savecurrent=true spice_ignore=0}
