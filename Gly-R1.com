%chk=Gly-R1.chk 
# opt freq b3lyp/6-31g(d,p) nosymm guess=always

gly_only

0 1
 N                -24.04850000  -52.06270000   10.23160000
 C                -24.99440000  -52.80370000    9.38480000
 C                -24.44650000  -52.87900000    7.94760000
 O                -23.20410000  -52.88700000    7.74750000
 N                -25.37470000  -52.94150000    6.80940000
 C                -24.75490000  -52.30870000    5.63630000
 C                -24.57160000  -51.99080000   11.60360000
 C                -23.59910000  -51.92530000   12.79590000
 O                -25.81390000  -51.98280000   11.80370000
 H                -23.85110000  -52.82510000    5.38830000
 H                -25.43050000  -52.35420000    4.80780000
 H                -24.53180000  -51.28610000    5.85880000
 H                -26.21930000  -52.45890000    7.04120000
 H                -25.93890000  -52.30080000    9.38060000
 H                -25.11920000  -53.79360000    9.77130000
 H                -23.16590000  -52.53270000   10.23560000
 H                -22.69540000  -52.44170000   12.54790000
 H                -23.37610000  -50.90270000   13.01850000
 H                -24.05030000  -52.38590000   13.64980000

--link1--
%chk=Gly-R1_mp.chk
# opt freq  mp2/aug-cc-pVDZ nosymm guess=always

mp2_opt_freq

0 1
%OldChk=Gly-R1.chk


--Link1--
%Chk=_Gly_R1_mp.chk
# mp2/aug-cc-pVDZ SP nosymm guess=always

mp2_single_point

0 1
%OldChk=Gly-R1.chk


--Link1--
%Chk=_Gly_R1_solv
b3lyp/6-31G(d) SP SCRF=(PCM,Solvent=Water) nosymm guess=always 

gly_solv

0 1
%OldChk=Gly-R1.chk


--Link1--
%Chk=_Gly_R1_gas
b3lyp/6-31G(d) SP nosymm guess=always 

gly_gas

0 1
%OldChk=Gly-R1.chk

