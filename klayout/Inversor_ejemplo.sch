v {xschem version=3.4.5 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
B 2 -840 -730 -40 -330 {flags=graph
y1=-0.11

ypos1=0
ypos2=2
divy=5
subdivy=1
unity=1
x1=5.6477941e-09
x2=1.0385857e-08
divx=5
subdivx=1


dataset=-1
unitx=1
logx=0
logy=0
color="5 4"
node="out
in"
y2=3.7
rawfile=$netlist_dir/Inversor_ejemplo.raw
sim_type=tran}
N 40 60 40 110 {
lab=GND}
N 40 60 140 60 {
lab=GND}
N 140 -0 140 60 {
lab=GND}
N 40 0 140 0 {
lab=GND}
N 40 30 40 60 {
lab=GND}
N 40 -50 40 -30 {
lab=out}
N -50 -0 -0 -0 {
lab=in}
N -50 -110 -0 -110 {
lab=in}
N 40 -110 120 -110 {
lab=VDD}
N 40 -180 40 -140 {
lab=VDD}
N 120 -180 120 -110 {
lab=VDD}
N 40 -180 120 -180 {
lab=VDD}
N -170 -100 -170 -80 {
lab=GND}
N -170 -180 40 -180 {
lab=VDD}
N -170 -180 -170 -160 {
lab=VDD}
N 40 -50 190 -50 {
lab=out}
N 40 -80 40 -50 {
lab=out}
N -50 -20 -50 0 {
lab=in}
N -50 -110 -50 -20 {
lab=in}
N -230 100 -230 120 {
lab=GND}
N -230 -20 -230 40 {
lab=in}
N -240 -20 -230 -20 {
lab=in}
N -230 -20 -50 -20 {
lab=in}
C {sg13g2_pr/sg13_hv_nmos.sym} 20 0 2 1 {name=M1
l=0.22u
w=5u
ng=1
m=54
model=sg13_hv_nmos
spiceprefix=X
}
C {sg13g2_pr/sg13_hv_pmos.sym} 20 -110 0 0 {name=M2
l=0.22u
w=5u
ng=1
m=54
model=sg13_hv_pmos
spiceprefix=X
}
C {devices/gnd.sym} -170 -80 0 0 {name=l2 lab=GND}
C {devices/vsource.sym} -170 -130 0 0 {name=Vgs value=3.3}
C {devices/gnd.sym} -170 -80 0 0 {name=l6 lab=GND}
C {devices/gnd.sym} 40 110 0 0 {name=l1 lab=GND}
C {devices/code_shown.sym} 310 -250 0 0 {name=MODEL only_toplevel=true
format="tcleval( @value )"
value="
.lib cornerMOShv.lib mos_tt
"}
C {devices/code_shown.sym} 300 -150 0 0 {name=NGSPICE only_toplevel=true 
value="
.param temp=27
.control
save all 
tran 50p 200n
meas tran tdelay TRIG v(in) VAl=0.9 FALl=1 TARG v(out) VAl=0.9 RISE=1
write Inversor_ejemplo.raw
.endc
"}
C {devices/gnd.sym} -230 120 0 0 {name=l4 lab=GND}
C {devices/vsource.sym} -230 70 0 0 {name=Vin value="dc 0 ac 0 pulse(0, 3.3, 0, 100p, 100p, 2n, 4n ) "}
C {devices/launcher.sym} -460 -250 0 0 {name=h5
descr="load waves Ctrl + left click" 
tclcommand="xschem raw_read $netlist_dir/Inversor_ejemplo.raw tran"
}
C {devices/lab_pin.sym} -240 -20 0 0 {name=p1 sig_type=std_logic lab=in}
C {devices/lab_pin.sym} 190 -50 2 0 {name=p2 sig_type=std_logic lab=out}
C {devices/lab_pin.sym} -50 -180 0 0 {name=p3 sig_type=std_logic lab=VDD
}
