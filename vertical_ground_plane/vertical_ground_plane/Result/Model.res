MWS Result File Version 20150206
size=i:49

type=s:DATA_FOLDER
problemclass=s::8:1000
visibility=s:hidden
creation=s:internal
lifetime=s:rebuild
result=s:1
files=s:raw_data

type=s:HIDDENITEM
problemclass=s::8:1000
visibility=s:hidden
creation=s:internal
lifetime=s:rebuild
result=s:1
files=s:e-field (f=400)_1,1.m3d

type=s:HIDDENITEM
problemclass=s::8:1000
visibility=s:hidden
creation=s:internal
lifetime=s:rebuild
result=s:1
files=s:h-field (f=400)_1,1.m3d

type=s:HIDDENITEM
problemclass=s::8:1000
visibility=s:hidden
creation=s:internal
lifetime=s:surviveparchange
result=s:1
files=s:simulation_overview.json

type=s:HIDDENITEM
problemclass=s::8:1000
visibility=s:hidden
creation=s:internal
lifetime=s:rebuild
result=s:1
files=s:RefSpectrum_1.sig

type=s:HIDDENITEM
problemclass=s::8:1000
visibility=s:hidden
creation=s:internal
lifetime=s:solverstart
result=s:0
files=s:PBAMeshDetails.axg

type=s:HIDDENITEM
problemclass=s::8:1000
visibility=s:hidden
creation=s:internal
lifetime=s:solverstart
result=s:0
files=s:PBAMeshFeedback.axg

type=s:HIDDENITEM
problemclass=s::8:1000
visibility=s:hidden
creation=s:internal
lifetime=s:rebuild
result=s:1
files=s:World.fid

type=s:HIDDENITEM
problemclass=s::8:1000
visibility=s:hidden
creation=s:internal
lifetime=s:survivemeshadapt
result=s:1
files=s:model.gex

type=s:HIDDENITEM
problemclass=s::8:1000
visibility=s:hidden
creation=s:internal
lifetime=s:survivemeshadapt
result=s:1
files=s:PP.sid

type=s:HIDDENITEM
problemclass=s::8:1000
visibility=s:hidden
creation=s:internal
lifetime=s:survivemeshadapt
result=s:1
files=s:PP.fmm

type=s:HIDDENITEM
problemclass=s::8:1000
visibility=s:hidden
creation=s:internal
lifetime=s:rebuild
result=s:0
files=s:ml_info.dat

type=s:FOLDER
problemclass=s::8:1000
visibility=s:visible
creation=s:internal
lifetime=s:persistent
result=s:0
treepath=s:1D Results

type=s:XYSIGNAL
subtype=s:user
problemclass=s::4:3
visibility=s:visible
creation=s:internal
lifetime=s:persistent
result=s:0
treepath=s:Excitation Signals\default
files=s:signal_default_lf.sig

type=s:XYSIGNAL
subtype=s:user
problemclass=s::0:0
visibility=s:visible
creation=s:internal
lifetime=s:persistent
result=s:0
treepath=s:Excitation Signals\default
files=s:signal_default.sig

type=s:MESH_FEEDBACK
problemclass=s::8:1000
visibility=s:visible
creation=s:internal
lifetime=s:solverstart
result=s:0
treepath=s:Mesh\Information\PBA
files=s:PBAMeshFeedback.rex
ylabel=s:Mesh Feedback

type=s:MESH_FEEDBACK
problemclass=s::8:1000
visibility=s:visible
creation=s:internal
lifetime=s:solverstart
result=s:0
treepath=s:Mesh\Information\PBADetails
files=s:PBAMeshDetails.rex
ylabel=s:Mesh Feedback

type=s:XYSIGNAL
subtype=s:time
problemclass=s::8:1000
visibility=s:visible
creation=s:internal
lifetime=s:rebuild
result=s:1
treepath=s:1D Results\Port signals\i1
files=s:i1(1).sig

type=s:XYSIGNAL
subtype=s:time
problemclass=s::8:1000
visibility=s:visible
creation=s:internal
lifetime=s:rebuild
result=s:1
treepath=s:1D Results\Port signals\o1,1
files=s:o1(1)1(1).sig

type=s:XYSIGNAL
subtype=s:complex
problemclass=s::8:1000
visibility=s:visible
creation=s:internal
lifetime=s:rebuild
result=s:1
treepath=s:1D Results\S-Parameters\S1,1
files=s:cS1(1)1(1).sig

type=s:XYSIGNAL
subtype=s:balance
problemclass=s::8:1000
visibility=s:visible
creation=s:internal
lifetime=s:rebuild
result=s:1
treepath=s:1D Results\Balance\Balance [1]
files=s:1.bil

type=s:XYSIGNAL
subtype=s:complex
problemclass=s::8:1000
visibility=s:visible
creation=s:internal
lifetime=s:rebuild
result=s:1
treepath=s:1D Results\Power\Excitation [1]\Power Stimulated
files=s:StimulatedPower_1.sig

type=s:XYSIGNAL
subtype=s:complex
problemclass=s::8:1000
visibility=s:visible
creation=s:internal
lifetime=s:rebuild
result=s:1
treepath=s:1D Results\Power\Excitation [1]\Power Outgoing all Ports
files=s:ReflectedPower_1.sig

type=s:XYSIGNAL
subtype=s:complex
problemclass=s::8:1000
visibility=s:visible
creation=s:internal
lifetime=s:rebuild
result=s:1
treepath=s:1D Results\Power\Excitation [1]\Power Accepted
files=s:AcceptedPower_1.sig

type=s:XYSIGNAL
subtype=s:complex
problemclass=s::8:1000
visibility=s:visible
creation=s:internal
lifetime=s:rebuild
result=s:1
treepath=s:1D Results\Power\Excitation [1]\Power Accepted per Port\Port 1
files=s:AcceptedPower_1(1).sig

type=s:XYSIGNAL
subtype=s:energy
problemclass=s::8:1000
visibility=s:visible
creation=s:internal
lifetime=s:rebuild
result=s:1
treepath=s:1D Results\Energy\Energy [1]
files=s:1.eng

type=s:HFIELD3D
problemclass=s::8:1000
visibility=s:visible
creation=s:internal
lifetime=s:rebuild
result=s:1
treepath=s:2D/3D Results\H-Field\h-field (f=400) [1]
files=s:h-field (f=400)_1,1.m3d
files=s:h-field (f=400)_1,1_m3d.rex

type=s:SURFACECURRENT
problemclass=s::8:1000
visibility=s:visible
creation=s:internal
lifetime=s:rebuild
result=s:1
treepath=s:2D/3D Results\Surface Current\surface current (f=400) [1]
files=s:h-field (f=400)_1,1.m3d
files=s:h-field (f=400)_1,1_m3d_sct.rex

type=s:EFIELD3D
problemclass=s::8:1000
visibility=s:visible
creation=s:internal
lifetime=s:rebuild
result=s:1
treepath=s:2D/3D Results\E-Field\e-field (f=400) [1]
files=s:e-field (f=400)_1,1.m3d
files=s:e-field (f=400)_1,1_m3d.rex

type=s:FARFIELD
problemclass=s::8:1000
visibility=s:visible
creation=s:internal
lifetime=s:rebuild
result=s:1
treepath=s:Farfields\farfield (f=frequency_centre) [1]
files=s:farfield (f=frequency_centre)_1.ffm
ylabel=s:farfield (f=frequency_centre) [1]

type=s:XYSIGNAL
subtype=s:complex
problemclass=s::8:1000
visibility=s:visible
creation=s:internal
lifetime=s:rebuild
result=s:1
treepath=s:1D Results\Power\Excitation [1]\Power Radiated
files=s:RadiatedPower_1.sig

type=s:XYSIGNAL
subtype=s:complex
problemclass=s::8:1000
visibility=s:visible
creation=s:internal
lifetime=s:rebuild
result=s:1
treepath=s:1D Results\Efficiencies\Rad. Efficiency [1]
files=s:FarfieldMetaData_1_RadEff.sig

type=s:XYSIGNAL
subtype=s:complex
problemclass=s::8:1000
visibility=s:visible
creation=s:internal
lifetime=s:rebuild
result=s:1
treepath=s:1D Results\Efficiencies\Tot. Efficiency [1]
files=s:FarfieldMetaData_1_TotEff.sig

type=s:XYSIGNAL
subtype=s:complex
problemclass=s::8:1000
visibility=s:visible
creation=s:internal
lifetime=s:rebuild
result=s:1
treepath=s:1D Results\Reference Impedance\ZRef 1(1)
files=s:ZRef1(1).sig

type=s:RESULT_0D
problemclass=s::8:1000
visibility=s:hidden
creation=s:internal
lifetime=s:rebuild
result=s:1
treepath=s:1D Results\AutomaticRunInformation
files=s:AutomaticRunInformation

type=s:XYSIGNAL
subtype=s:time
problemclass=s::8:1000
visibility=s:visible
creation=s:internal
lifetime=s:surviveparchange
result=s:1
parametric=s:P
treepath=s:1D Results\Port signals\i1
files=s:i1(1).sig

type=s:XYSIGNAL
subtype=s:time
problemclass=s::8:1000
visibility=s:visible
creation=s:internal
lifetime=s:surviveparchange
result=s:1
parametric=s:P
treepath=s:1D Results\Port signals\o1,1
files=s:o1(1)1(1).sig

type=s:XYSIGNAL
subtype=s:complex
problemclass=s::8:1000
visibility=s:visible
creation=s:internal
lifetime=s:surviveparchange
result=s:1
parametric=s:P
treepath=s:1D Results\S-Parameters\S1,1
files=s:cS1(1)1(1).sig

type=s:XYSIGNAL
subtype=s:balance
problemclass=s::8:1000
visibility=s:visible
creation=s:internal
lifetime=s:surviveparchange
result=s:1
parametric=s:P
treepath=s:1D Results\Balance\Balance [1]
files=s:1.bil

type=s:XYSIGNAL
subtype=s:complex
problemclass=s::8:1000
visibility=s:visible
creation=s:internal
lifetime=s:surviveparchange
result=s:1
parametric=s:P
treepath=s:1D Results\Power\Excitation [1]\Power Stimulated
files=s:StimulatedPower_1.sig

type=s:XYSIGNAL
subtype=s:complex
problemclass=s::8:1000
visibility=s:visible
creation=s:internal
lifetime=s:surviveparchange
result=s:1
parametric=s:P
treepath=s:1D Results\Power\Excitation [1]\Power Outgoing all Ports
files=s:ReflectedPower_1.sig

type=s:XYSIGNAL
subtype=s:complex
problemclass=s::8:1000
visibility=s:visible
creation=s:internal
lifetime=s:surviveparchange
result=s:1
parametric=s:P
treepath=s:1D Results\Power\Excitation [1]\Power Accepted
files=s:AcceptedPower_1.sig

type=s:XYSIGNAL
subtype=s:complex
problemclass=s::8:1000
visibility=s:visible
creation=s:internal
lifetime=s:surviveparchange
result=s:1
parametric=s:P
treepath=s:1D Results\Power\Excitation [1]\Power Accepted per Port\Port 1
files=s:AcceptedPower_1(1).sig

type=s:XYSIGNAL
subtype=s:energy
problemclass=s::8:1000
visibility=s:visible
creation=s:internal
lifetime=s:surviveparchange
result=s:1
parametric=s:P
treepath=s:1D Results\Energy\Energy [1]
files=s:1.eng

type=s:XYSIGNAL
subtype=s:complex
problemclass=s::8:1000
visibility=s:visible
creation=s:internal
lifetime=s:surviveparchange
result=s:1
parametric=s:P
treepath=s:1D Results\Power\Excitation [1]\Power Radiated
files=s:RadiatedPower_1.sig

type=s:XYSIGNAL
subtype=s:complex
problemclass=s::8:1000
visibility=s:visible
creation=s:internal
lifetime=s:surviveparchange
result=s:1
parametric=s:P
treepath=s:1D Results\Efficiencies\Rad. Efficiency [1]
files=s:FarfieldMetaData_1_RadEff.sig

type=s:XYSIGNAL
subtype=s:complex
problemclass=s::8:1000
visibility=s:visible
creation=s:internal
lifetime=s:surviveparchange
result=s:1
parametric=s:P
treepath=s:1D Results\Efficiencies\Tot. Efficiency [1]
files=s:FarfieldMetaData_1_TotEff.sig

type=s:XYSIGNAL
subtype=s:complex
problemclass=s::8:1000
visibility=s:visible
creation=s:internal
lifetime=s:surviveparchange
result=s:1
parametric=s:P
treepath=s:1D Results\Reference Impedance\ZRef 1(1)
files=s:ZRef1(1).sig

type=s:RESULT_0D
problemclass=s::8:1000
visibility=s:hidden
creation=s:internal
lifetime=s:surviveparchange
result=s:1
parametric=s:P
treepath=s:1D Results\AutomaticRunInformation
files=s:AutomaticRunInformation

