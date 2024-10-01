v {xschem version=3.4.5 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
L 4 -4390 -790 -4390 -410 {}
L 4 -4050 -790 -4050 -400 {}
L 4 -4390 -410 -4390 -400 {}
L 4 -3720 -780 -3720 -400 {}
L 4 -3720 -880 -3720 -780 {}
T {Instrucciones} -3700 -880 0 0 0.8 0.8 {}
T {Ecuaciones} -3220 -880 0 0 0.8 0.8 {}
T {- d = Vo/Vin. => Como la señal de disparo VgM1 es el negado de VsdM1, d*=1-d.
- R=Vo/Io, C= (rI)/(8*rV*R*fsw), L = Vs/(4*Io*rI*fsw)} -3250 -810 0 0 0.4 0.4 {}
T {Specificaciones de diseño:
- fsw = 10mHz
- Vo = 1.2 V
- Io = 10 A
- rI = 0.3 , rV = 0.1
- eff>90%
- Area Infinita?

Metodologia de diseño:
1) Definir W/L para unidad de transistor PMOS y NMOS minimo => Ron minimo -- (TB_hvPMOS_charact y TB_hvNMOS_charact)
2) Dimensionar cantidad de transistores necesaria (cambiar solo parametro mult, W/L dejarlo fijo) para cumplir con la corriente pedida y un Vds<<1 -- (TB_hvMOS_POWER_Sizing)
3) Configurar señales de disparo en (TB_hvMOS_switch_test) para setear nueva fsw => Modificar param T,TdR,TdF. 
4) Calcular parametros del convertidor Buck, d,R,L,C. Usar rv=0.1 y ri=0.3. => Configurar simulacion (TB_DCDCBuck)
5) Ajuste manual de L y C. Dejar ripples cercanos a los especificados.
6)Luego ajuste de tiempos muertos, TdR=TdF, TR=TF => Revisar formas de onda y eficiencia. Primero dejar TdR y TdF como 0.1*T, definir TR y TF para que no haya peaks de corriente,
 luego ir reduciendo TdR y TdF hasta llegar al limite de generar peaks de corriente en M1 y M2.
7) Ajuste manal de cantidad de transistores en caso de tener muchas perdidas hasta tener eff>90%, luego ajuste de d para alcanzar Vo requerido.
8) Analizar perdidas y contrastar con Ron de M1 y M2.
} -3690 -810 0 0 0.4 0.4 {}
C {TB_hvPMOS_charact.sym} -4200 -750 0 0 {name=X1}
C {TB_hvNMOS_charact.sym} -4200 -700 0 0 {name=X2}
C {TB_hvMOS_POWER_Sizing.sym} -4200 -580 0 0 {name=X3}
C {TB_DCDCBuck.sym} -4200 -480 0 0 {name=X5}
C {title.sym} -4260 -330 0 0 {name=l1 author="Andrés Martínez"}
C {TB_hvMOS_switch_test.sym} -4200 -530 0 0 {name=X6}
C {/workspaces/usm-vlsi-tools/Workshop-CANELOS24/xschem/TB_hvPMOS_cgate-ext.sym} -3870 -700 0 0 {name=X10}
C {/workspaces/usm-vlsi-tools/Workshop-CANELOS24/xschem/TB_hvNMOS_cgate_ext.sym} -3870 -750 0 0 {name=X9}
