v {xschem version=3.4.5 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
T {l_min = 0.13u
w_max = 10u; w_min_HVnmos = 0.45u; w_min_HVpmos = 0.4u;} 180 -260 0 0 0.4 0.4 {}
N -210 -400 -210 -360 {
lab=GND}
N -490 0 -490 60 {
lab=GND}
N -210 -490 -210 -460 {
lab=Vg}
N -490 -60 -460 -60 {
lab=GND}
N -460 -60 -460 0 {
lab=GND}
N -490 0 -460 0 {
lab=GND}
N -490 -30 -490 0 {
lab=GND}
N -130 -490 -130 -460 {
lab=Vd}
N -490 -100 -490 -90 {
lab=#net1}
N -490 -180 -490 -160 {
lab=Vd}
N -560 -60 -530 -60 {
lab=Vg}
N -130 -400 -130 -360 {
lab=GND}
N -210 -360 -130 -360 {
lab=GND}
N -210 -360 -210 -340 {
lab=GND}
N -250 0 -250 60 {
lab=GND}
N -250 -60 -220 -60 {
lab=GND}
N -220 -60 -220 0 {
lab=GND}
N -250 0 -220 0 {
lab=GND}
N -250 -30 -250 0 {
lab=GND}
N -250 -100 -250 -90 {
lab=#net2}
N -250 -180 -250 -160 {
lab=Vd}
N -320 -60 -290 -60 {
lab=Vg}
N -20 0 -20 60 {
lab=GND}
N -20 -60 10 -60 {
lab=GND}
N 10 -60 10 0 {
lab=GND}
N -20 0 10 0 {
lab=GND}
N -20 -30 -20 0 {
lab=GND}
N -20 -100 -20 -90 {
lab=#net3}
N -20 -180 -20 -160 {
lab=Vd}
N -90 -60 -60 -60 {
lab=Vg}
C {sg13g2_pr/sg13_hv_nmos.sym} -510 -60 2 1 {name=M1
l=\{l_M1\}
w=\{w_M1\}
ng=1
m=\{mult_M1\}
model=sg13_hv_nmos
spiceprefix=X
}
C {vsource.sym} -210 -430 0 0 {name=Vgs value=1.5 savecurrent=false}
C {vsource.sym} -130 -430 0 0 {name=Vds value=3.3 savecurrent=false}
C {gnd.sym} -490 60 0 0 {name=l1 lab=GND}
C {code_shown.sym} 190 -160 0 0 {name=Simulation only_toplevel=false 

value="
.param temp=27
.param mult_M1 = 1200
.param w_M1 =10u 
*.param l_M1 =0.25u
.param l_M1 =0.22u

.param mult_M2 = 1200
.param w_M2 =10u 
.param l_M2 =0.25u

.param mult_M3 = 1200
.param w_M3 =10u 
.param l_M3 =0.35u

.save all
* + @M.XM1.m1[id]
+ @n.xm1.nsg13_hv_nmos[vth]
+ @n.xm2.nsg13_hv_nmos[vth]
+ @n.xm3.nsg13_hv_nmos[vth]

.control 
dc Vds 0 3.3 0.05 Vgs 0 3.3 1.1
*dc Vds 0 0.5 0.01 temp 0 27 1
write dc_hv_nmos.raw
plot i(VdM1)
plot i(VdM2)
plot i(VdM3)
print @n.xm1.nsg13_hv_nmos[vth] @n.xm2.nsg13_hv_nmos[vth]
*print @n.xm2.nsg13_hv_nmos[vth]
write test_nmos.raw




.endc
"}
C {code_shown.sym} 550 -150 0 0 {name=MODEL only_toplevel=true
format="tcleval( @value )"
value="
.lib cornerMOShv.lib mos_tt
"}
C {lab_pin.sym} -130 -490 0 0 {name=p2 sig_type=std_logic lab=Vd}
C {lab_pin.sym} -490 -180 0 0 {name=p1 sig_type=std_logic lab=Vd}
C {ammeter.sym} -490 -130 0 0 {name=VdM1 savecurrent=true spice_ignore=0}
C {ngspice_get_value.sym} -560 -10 0 0 {name=r6 node=v(@n.xm1.nsg13_hv_nmos[vth])
descr="Vth="}
C {lab_pin.sym} -210 -490 0 0 {name=p3 sig_type=std_logic lab=Vg}
C {lab_pin.sym} -560 -60 0 0 {name=p4 sig_type=std_logic lab=Vg}
C {gnd.sym} -210 -340 0 0 {name=l2 lab=GND}
C {sg13g2_pr/sg13_hv_nmos.sym} -270 -60 2 1 {name=M2
l=\{l_M2\}
w=\{w_M2\}
ng=1
m=\{mult_M2\}
model=sg13_hv_nmos
spiceprefix=X
}
C {gnd.sym} -250 60 0 0 {name=l3 lab=GND}
C {lab_pin.sym} -250 -180 0 0 {name=p5 sig_type=std_logic lab=Vd}
C {ammeter.sym} -250 -130 0 0 {name=VdM2 savecurrent=true spice_ignore=0}
C {ngspice_get_value.sym} -320 -10 0 0 {name=r1 node=v(@n.xm1.nsg13_hv_nmos[vth])
descr="Vth="}
C {lab_pin.sym} -320 -60 0 0 {name=p6 sig_type=std_logic lab=Vg}
C {sg13g2_pr/sg13_hv_nmos.sym} -40 -60 2 1 {name=M3
l=\{l_M3\}
w=\{w_M3\}
ng=1
m=\{mult_M3\}
model=sg13_hv_nmos
spiceprefix=X
}
C {gnd.sym} -20 60 0 0 {name=l4 lab=GND}
C {lab_pin.sym} -20 -180 0 0 {name=p7 sig_type=std_logic lab=Vd}
C {ammeter.sym} -20 -130 0 0 {name=VdM3 savecurrent=true spice_ignore=0}
C {ngspice_get_value.sym} -90 -10 0 0 {name=r2 node=v(@n.xm1.nsg13_hv_nmos[vth])
descr="Vth="}
C {lab_pin.sym} -90 -60 0 0 {name=p8 sig_type=std_logic lab=Vg}
