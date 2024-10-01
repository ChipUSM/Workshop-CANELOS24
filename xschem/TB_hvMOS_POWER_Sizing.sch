v {xschem version=3.4.5 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N -660 -330 -660 -290 {
lab=GND}
N -660 -420 -660 -390 {
lab=Vg}
N -580 -420 -580 -390 {
lab=Vd}
N -580 -330 -580 -290 {
lab=GND}
N -660 -290 -580 -290 {
lab=GND}
N -660 -290 -660 -270 {
lab=GND}
N -510 -330 -510 -290 {
lab=GND}
N -580 -290 -510 -290 {
lab=GND}
N -510 -420 -510 -390 {
lab=Vdd}
N -700 -110 -670 -110 {
lab=GND}
N -670 -110 -670 -50 {
lab=GND}
N -700 -50 -670 -50 {
lab=GND}
N -700 -150 -700 -140 {
lab=#net1}
N -700 -230 -700 -210 {
lab=Vd}
N -770 -110 -740 -110 {
lab=Vg}
N -560 -110 -520 -110 {
lab=Vg}
N -480 -80 -480 -40 {
lab=Vd_p}
N -480 -150 -480 -140 {
lab=#net2}
N -480 -110 -460 -110 {
lab=#net2}
N -460 -150 -460 -110 {
lab=#net2}
N -480 -150 -460 -150 {
lab=#net2}
N -480 -170 -480 -150 {
lab=#net2}
N -750 -290 -660 -290 {
lab=GND}
N -750 -330 -750 -290 {
lab=GND}
N -750 -420 -750 -390 {
lab=Vd_p}
N -700 -50 -700 -40 {
lab=GND}
N -700 -80 -700 -50 {
lab=GND}
C {vsource.sym} -660 -360 0 0 {name=Vg value=3.3 savecurrent=false}
C {vsource.sym} -580 -360 0 0 {name=Vds value=3.3 savecurrent=false}
C {lab_pin.sym} -580 -420 0 0 {name=p1 sig_type=std_logic lab=Vd}
C {lab_pin.sym} -660 -420 0 0 {name=p4 sig_type=std_logic lab=Vg}
C {gnd.sym} -660 -270 0 0 {name=l2 lab=GND}
C {vsource.sym} -510 -360 0 0 {name=Vdd value=3.3 savecurrent=false}
C {lab_pin.sym} -510 -420 0 0 {name=p5 sig_type=std_logic lab=Vdd}
C {code_shown.sym} -1130 -420 0 0 {name=MODEL only_toplevel=true
format="tcleval( @value )"
value="
.lib cornerMOShv.lib mos_tt
"}
C {devices/code.sym} -1130 -160 0 0 {name=DC_sweep_simulation only_toplevel=false 
value="
.save all
* + @M.XM1.m1[id]
+ @n.xm1.nsg13_hv_pmos[vth]
+ @n.xm1.nsg13_hv_pmos[gds]
+ @n.xm1.nsg13_hv_pmos[ad]
+ @n.xm2.nsg13_hv_nmos[vth]
+ @n.xm2.nsg13_hv_nmos[gds]

.control
reset 
alter Vg 3.3
dc Vds 0 0.5 0.01 
*dc Vds 0 0.5 0.01 temp 0 27 1
let Vds_M2 = v(Vd) 
plot i(VdM2) vs Vds_M2

let G_M2 = @n.xm2.nsg13_hv_nmos[gds]
let Ron_M2 = 1/G_M2
let I_M2 = i(VdM2)
let G_M22 = deriv(I_M2)
let Ron_M22 = 1/G_M22

plot Ron_M2 vs Vds_M2

*let VthM1_off =  @n.xm1.nsg13_hv_pmos[vth]  
*let VthM2 =  @n.xm2.nsg13_hv_nmos[vth]
*plot VthM1_off
*plot VthM2
.endc

.control
reset 
alter Vg 0
dc Vd_M1 2.5 3.3 0.01 
*dc Vd_M1 2 3.3 0.01 temp 0 27 1

let Vsd_M1 = v(Vdd) -v(Vd_p)
plot i(VdM1) vs Vsd_M1
let G_M1 = @n.xm1.nsg13_hv_pmos[gds]
let Ron_M1 = 1/G_M1
let I_M1 = i(VdM1)
let G_M11 = deriv(I_M1)
let Ron_M11 = -1/G_M11

plot Ron_M1 vs Vsd_M1

*plot Ron_M11 
*plot Ron_M11 vs Vsd_M1
*let VthM1_on = @n.xm1.nsg13_hv_pmos[vth]
*plot VthM1_on
.endc

.control 
reset
alter Vg 3.3
dc Vd_M1 0 3.3 0.01 
let Vsd_M1 = v(Vdd) -v(Vd_p)
*plot i(VdM1) vs Vsd_M1
let G_M1 = @n.xm1.nsg13_hv_pmos[gds]
let I_M1 = i(VdM1)


let VthM1_subth = @n.xm1.nsg13_hv_pmos[vth]
*plot VthM1_subth
.endc
.end
"}
C {sg13g2_pr/sg13_hv_nmos.sym} -720 -110 2 1 {name=M2
l=\{l_M2\}
w=\{w_M2\}
ng=\{ng_M2\}
m=\{mult_M2\}
model=sg13_hv_nmos
spiceprefix=X
}
C {gnd.sym} -700 -40 0 0 {name=l1 lab=GND}
C {lab_pin.sym} -700 -230 0 0 {name=p2 sig_type=std_logic lab=Vd}
C {ammeter.sym} -480 -200 0 0 {name=VdM1 savecurrent=true spice_ignore=0}
C {ngspice_get_value.sym} -770 -60 0 0 {name=r6 node=v(@n.xm1.nsg13_hv_nmos[vth])
descr="Vth="}
C {lab_pin.sym} -770 -110 0 0 {name=p3 sig_type=std_logic lab=Vg}
C {sg13g2_pr/sg13_hv_pmos.sym} -500 -110 0 0 {name=M1
l=\{l_M1\}
w=\{w_M1\}
ng=\{ng_M1\}
m=\{mult_M1\}
model=sg13_hv_pmos
spiceprefix=X
}
C {lab_pin.sym} -480 -40 0 0 {name=p7 sig_type=std_logic lab=Vd_p}
C {lab_pin.sym} -560 -110 0 0 {name=p8 sig_type=std_logic lab=Vg}
C {lab_pin.sym} -480 -230 0 0 {name=p9 sig_type=std_logic lab=Vdd}
C {ammeter.sym} -700 -180 0 0 {name=VdM2 savecurrent=true spice_ignore=0}
C {vsource.sym} -750 -360 0 0 {name=Vd_M1 value=3.3 savecurrent=false}
C {lab_pin.sym} -750 -420 0 0 {name=p6 sig_type=std_logic lab=Vd_p}
C {code.sym} -1130 -330 0 0 {name=POWER_MOS_Parameters only_toplevel=false 

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
