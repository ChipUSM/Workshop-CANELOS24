v {xschem version=3.4.5 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
T {PULSE(VL VH TD TR TF PW PER PHASE) 
} -660 -400 0 0 0.4 0.4 {}
N -370 -180 -370 -170 {
lab=VgM1}
N -230 -300 -230 -200 {
lab=#net1}
N -90 -300 -90 -260 {
lab=V1}
N -90 -200 -90 -100 {
lab=GND}
N -230 -100 -90 -100 {
lab=GND}
N -230 -100 -230 -50 {
lab=GND}
N -370 -110 -370 -100 {
lab=GND}
N -370 -100 -230 -100 {
lab=GND}
N -230 -130 -230 -100 {
lab=GND}
N -370 -180 -340 -180 {
lab=VgM1}
N -340 -180 -340 -170 {
lab=VgM1}
N -340 -170 -270 -170 {
lab=VgM1}
N -230 -170 -210 -170 {
lab=GND}
N -210 -170 -210 -130 {
lab=GND}
N -230 -130 -210 -130 {
lab=GND}
N -230 -140 -230 -130 {
lab=GND}
N -130 -300 -90 -300 {
lab=V1}
N -230 -300 -190 -300 {
lab=#net1}
C {vsource.sym} -370 -140 0 1 {name=Vg value=3}
C {vsource.sym} -90 -230 0 0 {name=Vdd value=DC\{Vdd\} savecurrent=false}
C {gnd.sym} -230 -50 0 0 {name=l1 lab=GND}
C {code_shown.sym} -1040 -370 0 0 {name=Simulation only_toplevel=false 

value="
*Simulations
.control
  *tran 0.1u 3u
  dc Vdd 0 1 0.01 
  *setplot tran1
  plot v(Vconm1)
  plot i(Vdd)
  plot v(VgM1)
  plot v(V1)
  print @n.xm1.nsg13_hv_nmos[vth]

.endc
.end


"}
C {code.sym} -1290 -350 0 0 {name=MODEL only_toplevel=true
format="tcleval( @value )"
value="
.lib cornerMOShv.lib mos_tt
"}
C {lab_pin.sym} -350 -180 0 1 {name=p2 sig_type=std_logic lab=VgM1}
C {ammeter.sym} -160 -300 1 1 {name=iM1 savecurrent=true spice_ignore=0}
C {lab_pin.sym} -90 -300 0 1 {name=p3 sig_type=std_logic lab=V1}
C {ngspice_get_value.sym} -280 -180 0 0 {name=r2 node=v(@n.xm1.nsg13_hv_nmos[vth])
descr="Vth="}
C {launcher.sym} -360 -330 0 0 {name=h1
descr="Annotate OP" 
tclcommand="set show_hidden_texts 1; xschem annotate_op"
*tclcommand="xschem annotate_op"}
C {code.sym} -1290 -180 0 0 {name=POWER_MOS_Parameters only_toplevel=false 

value="
.param temp=27
.param mult_M1 = 100
.param w_M1 =10u 
.param l_M1 =0.25u
.param ng_M1 =1

"}
C {code_shown.sym} -1290 -30 0 0 {name=Simulation_Parameters only_toplevel=false 

value="
* OP Parameters & Singals to save
.param R = 1
.param Vdd = 3
.param VH = 1.5
.param D = 0.5
.param T = 1u
.param temp=27



.save all
+ @n.xm1.nsg13_hv_nmos[vth]

"}
C {sg13g2_pr/sg13_hv_nmos.sym} -250 -170 2 1 {name=M1
l=\{l_M1\}
w=\{w_M1\}
ng=\{ng_M1\}
m=\{mult_M1\}
model=sg13_hv_nmos
spiceprefix=X
}
