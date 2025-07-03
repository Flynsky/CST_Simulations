'# MWS Version: Version 2024.0 - Sep 01 2023 - ACIS 33.0.1 -

'# length = mm
'# frequency = GHz
'# time = ns
'# frequency range: fmin = 0.9*frequency_centre fmax = 1.1*frequency_centre


'@ use template: Antenna - Waveguide_8

'[VERSION]2014.6|23.0.0|20141128[/VERSION]
'set the units
With Units
     .Geometry "mm"
     .Frequency "GHz"
    .Voltage "V"
    .Resistance "Ohm"
    .Inductance "NanoH"
    .TemperatureUnit  "Kelvin"
    .Time "ns"
    .Current "A"
    .Conductance "Siemens"
    .Capacitance "PikoF"
End With
'----------------------------------------------------------------------------
Plot.DrawBox True
With Background
     .Type "Normal"
     .Epsilon "1.0"
     .Mue "1.0"
     .XminSpace "0.0"
     .XmaxSpace "0.0"
     .YminSpace "0.0"
     .YmaxSpace "0.0"
     .ZminSpace "0.0"
     .ZmaxSpace "0.0"
End With
With Boundary
     .Xmin "expanded open"
     .Xmax "expanded open"
     .Ymin "expanded open"
     .Ymax "expanded open"
     .Zmin "expanded open"
     .Zmax "expanded open"
     .Xsymmetry "none"
     .Ysymmetry "none"
     .Zsymmetry "none"
End With
' switch on FD-TET setting for accurate farfields
FDSolver.ExtrudeOpenBC "True"
Mesh.FPBAAvoidNonRegUnite "True"
Mesh.ConsiderSpaceForLowerMeshLimit "False"
Mesh.MinimumStepNumber "5"
With MeshSettings
     .SetMeshType "Hex"
     .Set "RatioLimitGeometry", "20"
End With
With MeshSettings
     .SetMeshType "HexTLM"
     .Set "RatioLimitGeometry", "20"
End With
PostProcess1D.ActivateOperation "vswr", "true"
PostProcess1D.ActivateOperation "yz-matrices", "true"
'----------------------------------------------------------------------------
With MeshSettings
     .SetMeshType "Hex"
     .Set "Version", 1%
End With
With Mesh
     .MeshType "PBA"
End With
'set the solver type
ChangeSolverType("HF Time Domain")
'----------------------------------------------------------------------------
'preserve project units
With Units 
     .Geometry "mm"
     .Frequency "GHz"
     .Time "ns" 
     .TemperatureUnit "Kelvin" 
     .Voltage "V" 
     .Current "A" 
     .Resistance "Ohm" 
     .Conductance "Siemens" 
     .Capacitance "PikoF" 
     .Inductance "NanoH" 
End With

'@ new component: antenna

'[VERSION]2013.1|23.0.0|20130516[/VERSION]
Component.New "antenna"

'@ define brick: antenna:waveguide

'[VERSION]2013.1|23.0.0|20130516[/VERSION]
With Brick
     .Reset 
     .Name "waveguide" 
     .Component "antenna" 
     .Material "PEC" 
     .Xrange "-waveguide_height/2", "waveguide_height/2" 
     .Yrange "-waveguide_length/2", "waveguide_length/2" 
     .Zrange "-waveguide_width/2", "waveguide_width/2"      
.Create
End With

'@ pick face

'[VERSION]2013.1|23.0.0|20130516[/VERSION]
Pick.PickFaceFromId "antenna:waveguide", "3"

'@ shell object: antenna:waveguide

'[VERSION]2013.1|23.0.0|20130516[/VERSION]
Solid.ShellAdvanced "antenna:waveguide", "Outside", "metal_thickness", "True"

'@ execute macro: slots

'[VERSION]2013.1|23.0.0|20130516[/VERSION]
MakeSureParameterExists("slot_angle_1","0")
MakeSureParameterExists("slot_angle_2","0")
MakeSureParameterExists("slot_angle_3","0")
MakeSureParameterExists("slot_angle_4","0")
MakeSureParameterExists("slot_angle_5","0")
MakeSureParameterExists("slot_angle_6","0")
MakeSureParameterExists("slot_angle_7","0")
MakeSureParameterExists("slot_angle_8","0")
MakeSureParameterExists("slot_angle_9","0")
MakeSureParameterExists("slot_angle_10","0")
MakeSureParameterExists("slot_angle_11","0")
MakeSureParameterExists("slot_angle_12","0")
MakeSureParameterExists("slot_angle_13","0")
MakeSureParameterExists("slot_angle_14","0")
MakeSureParameterExists("slot_angle_15","0")
MakeSureParameterExists("slot_angle_16","0")
MakeSureParameterExists("slot_angle_17","0")
MakeSureParameterExists("slot_angle_18","0")
MakeSureParameterExists("slot_angle_19","0")
MakeSureParameterExists("slot_angle_20","0")
MakeSureParameterExists("slot_angle_21","0")
MakeSureParameterExists("slot_angle_22","0")
MakeSureParameterExists("slot_angle_23","0")
MakeSureParameterExists("slot_angle_24","0")
MakeSureParameterExists("slot_angle_25","0")
MakeSureParameterExists("slot_angle_26","0")
MakeSureParameterExists("slot_angle_27","0")
MakeSureParameterExists("slot_angle_28","0")
MakeSureParameterExists("slot_angle_29","0")
MakeSureParameterExists("slot_angle_30","0")
MakeSureParameterExists("slot_angle_31","0")
MakeSureParameterExists("slot_angle_32","0")
MakeSureParameterExists("slot_angle_33","0")
MakeSureParameterExists("slot_angle_34","0")
MakeSureParameterExists("slot_angle_35","0")
MakeSureParameterExists("slot_angle_36","0")
MakeSureParameterExists("slot_angle_37","0")
MakeSureParameterExists("slot_angle_38","0")
MakeSureParameterExists("slot_angle_39","0")
MakeSureParameterExists("slot_angle_40","0")
MakeSureParameterExists("slot_angle_41","0")
MakeSureParameterExists("slot_angle_42","0")
MakeSureParameterExists("slot_angle_43","0")
MakeSureParameterExists("slot_angle_44","0")
MakeSureParameterExists("slot_angle_45","0")
MakeSureParameterExists("slot_angle_46","0")
MakeSureParameterExists("slot_angle_47","0")
MakeSureParameterExists("slot_angle_48","0")
MakeSureParameterExists("slot_angle_49","0")
MakeSureParameterExists("slot_angle_50","0")
MakeSureParameterExists("slot_angle_51","0")
MakeSureParameterExists("slot_angle_52","0")
MakeSureParameterExists("slot_angle_53","0")
MakeSureParameterExists("slot_angle_54","0")
MakeSureParameterExists("slot_angle_55","0")
MakeSureParameterExists("slot_angle_56","0")
MakeSureParameterExists("slot_angle_57","0")
MakeSureParameterExists("slot_angle_58","0")
MakeSureParameterExists("slot_angle_59","0")
MakeSureParameterExists("slot_angle_60","0")
MakeSureParameterExists("slot_angle_61","0")
MakeSureParameterExists("slot_angle_62","0")
MakeSureParameterExists("slot_angle_63","0")
MakeSureParameterExists("slot_angle_64","0")
MakeSureParameterExists("slot_angle_65","0")
MakeSureParameterExists("slot_angle_66","0")
MakeSureParameterExists("slot_angle_67","0")
MakeSureParameterExists("slot_angle_68","0")
MakeSureParameterExists("slot_angle_69","0")
MakeSureParameterExists("slot_angle_70","0")
MakeSureParameterExists("slot_angle_71","0")
MakeSureParameterExists("slot_angle_72","0")
MakeSureParameterExists("slot_angle_73","0")
MakeSureParameterExists("slot_angle_74","0")
MakeSureParameterExists("slot_angle_75","0")
MakeSureParameterExists("slot_angle_76","0")
MakeSureParameterExists("slot_angle_77","0")
MakeSureParameterExists("slot_angle_78","0")
MakeSureParameterExists("slot_angle_79","0")
MakeSureParameterExists("slot_angle_80","0")
MakeSureParameterExists("slot_angle_81","0")
MakeSureParameterExists("slot_angle_82","0")
MakeSureParameterExists("slot_angle_83","0")
MakeSureParameterExists("slot_angle_84","0")
MakeSureParameterExists("slot_angle_85","0")
MakeSureParameterExists("slot_angle_86","0")
MakeSureParameterExists("slot_angle_87","0")
MakeSureParameterExists("slot_angle_88","0")
MakeSureParameterExists("slot_angle_89","0")
MakeSureParameterExists("slot_angle_90","0")
MakeSureParameterExists("slot_angle_91","0")
MakeSureParameterExists("slot_angle_92","0")
MakeSureParameterExists("slot_angle_93","0")
MakeSureParameterExists("slot_angle_94","0")
MakeSureParameterExists("slot_angle_95","0")
MakeSureParameterExists("slot_angle_96","0")
MakeSureParameterExists("slot_angle_97","0")
MakeSureParameterExists("slot_angle_98","0")
MakeSureParameterExists("slot_angle_99","0")
MakeSureParameterExists("slot_angle_100","0")
MakeSureParameterExists("slot_depth_1","0")
MakeSureParameterExists("slot_depth_2","0")
MakeSureParameterExists("slot_depth_3","0")
MakeSureParameterExists("slot_depth_4","0")
MakeSureParameterExists("slot_depth_5","0")
MakeSureParameterExists("slot_depth_6","0")
MakeSureParameterExists("slot_depth_7","0")
MakeSureParameterExists("slot_depth_8","0")
MakeSureParameterExists("slot_depth_9","0")
MakeSureParameterExists("slot_depth_10","0")
MakeSureParameterExists("slot_depth_11","0")
MakeSureParameterExists("slot_depth_12","0")
MakeSureParameterExists("slot_depth_13","0")
MakeSureParameterExists("slot_depth_14","0")
MakeSureParameterExists("slot_depth_15","0")
MakeSureParameterExists("slot_depth_16","0")
MakeSureParameterExists("slot_depth_17","0")
MakeSureParameterExists("slot_depth_18","0")
MakeSureParameterExists("slot_depth_19","0")
MakeSureParameterExists("slot_depth_20","0")
MakeSureParameterExists("slot_depth_21","0")
MakeSureParameterExists("slot_depth_22","0")
MakeSureParameterExists("slot_depth_23","0")
MakeSureParameterExists("slot_depth_24","0")
MakeSureParameterExists("slot_depth_25","0")
MakeSureParameterExists("slot_depth_26","0")
MakeSureParameterExists("slot_depth_27","0")
MakeSureParameterExists("slot_depth_28","0")
MakeSureParameterExists("slot_depth_29","0")
MakeSureParameterExists("slot_depth_30","0")
MakeSureParameterExists("slot_depth_31","0")
MakeSureParameterExists("slot_depth_32","0")
MakeSureParameterExists("slot_depth_33","0")
MakeSureParameterExists("slot_depth_34","0")
MakeSureParameterExists("slot_depth_35","0")
MakeSureParameterExists("slot_depth_36","0")
MakeSureParameterExists("slot_depth_37","0")
MakeSureParameterExists("slot_depth_38","0")
MakeSureParameterExists("slot_depth_39","0")
MakeSureParameterExists("slot_depth_40","0")
MakeSureParameterExists("slot_depth_41","0")
MakeSureParameterExists("slot_depth_42","0")
MakeSureParameterExists("slot_depth_43","0")
MakeSureParameterExists("slot_depth_44","0")
MakeSureParameterExists("slot_depth_45","0")
MakeSureParameterExists("slot_depth_46","0")
MakeSureParameterExists("slot_depth_47","0")
MakeSureParameterExists("slot_depth_48","0")
MakeSureParameterExists("slot_depth_49","0")
MakeSureParameterExists("slot_depth_50","0")
MakeSureParameterExists("slot_depth_51","0")
MakeSureParameterExists("slot_depth_52","0")
MakeSureParameterExists("slot_depth_53","0")
MakeSureParameterExists("slot_depth_54","0")
MakeSureParameterExists("slot_depth_55","0")
MakeSureParameterExists("slot_depth_56","0")
MakeSureParameterExists("slot_depth_57","0")
MakeSureParameterExists("slot_depth_58","0")
MakeSureParameterExists("slot_depth_59","0")
MakeSureParameterExists("slot_depth_60","0")
MakeSureParameterExists("slot_depth_61","0")
MakeSureParameterExists("slot_depth_62","0")
MakeSureParameterExists("slot_depth_63","0")
MakeSureParameterExists("slot_depth_64","0")
MakeSureParameterExists("slot_depth_65","0")
MakeSureParameterExists("slot_depth_66","0")
MakeSureParameterExists("slot_depth_67","0")
MakeSureParameterExists("slot_depth_68","0")
MakeSureParameterExists("slot_depth_69","0")
MakeSureParameterExists("slot_depth_70","0")
MakeSureParameterExists("slot_depth_71","0")
MakeSureParameterExists("slot_depth_72","0")
MakeSureParameterExists("slot_depth_73","0")
MakeSureParameterExists("slot_depth_74","0")
MakeSureParameterExists("slot_depth_75","0")
MakeSureParameterExists("slot_depth_76","0")
MakeSureParameterExists("slot_depth_77","0")
MakeSureParameterExists("slot_depth_78","0")
MakeSureParameterExists("slot_depth_79","0")
MakeSureParameterExists("slot_depth_80","0")
MakeSureParameterExists("slot_depth_81","0")
MakeSureParameterExists("slot_depth_82","0")
MakeSureParameterExists("slot_depth_83","0")
MakeSureParameterExists("slot_depth_84","0")
MakeSureParameterExists("slot_depth_85","0")
MakeSureParameterExists("slot_depth_86","0")
MakeSureParameterExists("slot_depth_87","0")
MakeSureParameterExists("slot_depth_88","0")
MakeSureParameterExists("slot_depth_89","0")
MakeSureParameterExists("slot_depth_90","0")
MakeSureParameterExists("slot_depth_91","0")
MakeSureParameterExists("slot_depth_92","0")
MakeSureParameterExists("slot_depth_93","0")
MakeSureParameterExists("slot_depth_94","0")
MakeSureParameterExists("slot_depth_95","0")
MakeSureParameterExists("slot_depth_96","0")
MakeSureParameterExists("slot_depth_97","0")
MakeSureParameterExists("slot_depth_98","0")
MakeSureParameterExists("slot_depth_99","0")
MakeSureParameterExists("slot_depth_100","0")
Dim slot_angles(1000) As Variant
Dim slot_depths(1000) As Variant
Dim th_name As String
Dim de_name As String
Dim cnt As Integer
For cnt = 1 To num_slots
	th_name="slot_angle_" + Cstr(cnt)
	de_name="slot_depth_" + Cstr(cnt)
	slot_angles(cnt-1)=Eval(th_name)*(-1)^(cnt)
	slot_depths(cnt-1)=Eval(de_name)
Next
'Create slots from array values and add together
For cnt = 0 To num_slots-1
	With Brick
	     .Reset
	     .Name "slot" + Cstr(cnt)
	     .Component "antenna"
	     .Material "PEC"
	     .Xrange -waveguide_height, waveguide_height
	     .Yrange -waveguide_length/2+inset_from_feed+cnt*slot_spacing-slot_width/2, -waveguide_length/2+inset_from_feed+cnt*slot_spacing+slot_width/2
	     .Zrange waveguide_width/2-slot_depths(cnt), waveguide_width/2+metal_thickness
	     .Create
	End With
	With Transform
	     .Reset
	     .Name "antenna:slot" + Cstr(cnt)
	     .Origin "CommonCenter"
	     .Angle "0", "0", slot_angles(cnt)
	     .MultipleObjects "False"
	     .GroupObjects "False"
	     .Repetitions "1"
	     .MultipleSelection "False"
	     .Transform "Shape", "Rotate"
	End With
Solid.Subtract "antenna:waveguide", "antenna:slot" + Cstr(cnt)
Next

'@ define port: 1

'[VERSION]2013.1|23.0.0|20130516[/VERSION]
With Port 
     .Reset 
     .PortNumber "1" 
     .Label "" 
     .NumberOfModes "1" 
     .AdjustPolarization "False" 
     .PolarizationAngle "0.0" 
     .ReferencePlaneDistance "0" 
     .TextSize "50" 
     .Coordinates "Free" 
     .Orientation "ymin" 
     .PortOnBound "False" 
     .ClipPickedPortToBound "False" 
     .Xrange "-waveguide_height/2-metal_thickness", "waveguide_height/2+metal_thickness" 
     .Yrange "-waveguide_length/2", "-waveguide_length/2" 
     .Zrange "-waveguide_width/2-metal_thickness", "waveguide_width/2+metal_thickness" 
     .XrangeAdd "0.0", "0.0" 
     .YrangeAdd "0.0", "0.0" 
     .ZrangeAdd "0.0", "0.0" 
     .SingleEnded "False" 
     .Create 
End With

'@ define frequency range

'[VERSION]2013.1|23.0.0|20130516[/VERSION]
Solver.FrequencyRange "0.9*frequency_centre", "1.1*frequency_centre"

'@ deactivate transient solver mesh adaptation

'[VERSION]2013.1|23.0.0|20130516[/VERSION]
Solver.MeshAdaption "False"

'@ farfield plot options

'[VERSION]2013.1|23.0.0|20130516[/VERSION]
With FarfieldPlot 
     .Plottype "Cartesian" 
     .Vary "angle1" 
     .Theta "90" 
     .Phi "90" 
     .Step "0.2" 
     .Step2 "0.2" 
     .SetLockSteps "True" 
     .SetPlotRangeOnly "False" 
     .SetThetaStart "0" 
     .SetThetaEnd "180" 
     .SetPhiStart "0" 
     .SetPhiEnd "360" 
     .SetTheta360 "True" 
     .SymmetricRange "True" 
     .SetTimeDomainFF "False" 
     .SetFrequency "10" 
     .SetTime "0" 
     .SetColorByValue "True" 
     .DrawStepLines "False" 
     .DrawIsoLongitudeLatitudeLines "False" 
     .ShowStructure "False" 
     .SetStructureTransparent "False" 
     .SetFarfieldTransparent "False" 
     .SetSpecials "enablepolarextralines" 
     .SetPlotMode "Directivity" 
     .Distance "1" 
     .UseFarfieldApproximation "True" 
     .SetScaleLinear "False" 
     .SetLogRange "40" 
     .SetLogNorm "0" 
     .DBUnit "0" 
     .EnableFixPlotMaximum "False" 
     .SetFixPlotMaximumValue "1.0" 
     .SetInverseAxialRatio "False" 
     .SetAxesType "user" 
     .Phistart "1.000000e+000", "0.000000e+000", "0.000000e+000" 
     .Thetastart "0.000000e+000", "0.000000e+000", "1.000000e+000" 
     .PolarizationVector "0.000000e+000", "1.000000e+000", "0.000000e+000" 
     .SetCoordinateSystemType "spherical" 
     .SetPolarizationType "Linear" 
     .SlantAngle 0.000000e+000 
     .Origin "bbox" 
     .Userorigin "0.000000e+000", "0.000000e+000", "0.000000e+000" 
     .SetUserDecouplingPlane "False" 
     .UseDecouplingPlane "False" 
     .DecouplingPlaneAxis "X" 
     .DecouplingPlanePosition "0.000000e+000" 
     .LossyGround "False" 
     .GroundEpsilon "1" 
     .GroundKappa "0" 
     .EnablePhaseCenterCalculation "False" 
     .SetPhaseCenterAngularLimit "3.000000e+001" 
     .SetPhaseCenterComponent "boresight" 
     .SetPhaseCenterPlane "both" 
     .ShowPhaseCenter "True" 
     .StoreSettings
End With

'@ define time domain solver parameters

'[VERSION]2013.1|23.0.0|20130516[/VERSION]
Mesh.SetCreator "High Frequency" 
With Solver 
     .Method "Hexahedral"
     .CalculationType "TD-S"
     .StimulationPort "All"
     .StimulationMode "All"
     .SteadyStateLimit "-30"
     .MeshAdaption "False"
     .AutoNormImpedance "False"
     .NormingImpedance "50"
     .CalculateModesOnly "False"
     .SParaSymmetry "False"
     .StoreTDResultsInCache  "False"
     .FullDeembedding "False"
     .SuperimposePLWExcitation "False"
     .UseSensitivityAnalysis "False"
End With

'@ farfield plot options

'[VERSION]2013.1|23.0.0|20130516[/VERSION]
With FarfieldPlot 
     .Plottype "3D" 
     .Vary "angle1" 
     .Theta "90" 
     .Phi "90" 
     .Step "5" 
     .Step2 "5" 
     .SetLockSteps "True" 
     .SetPlotRangeOnly "False" 
     .SetThetaStart "0" 
     .SetThetaEnd "180" 
     .SetPhiStart "0" 
     .SetPhiEnd "360" 
     .SetTheta360 "True" 
     .SymmetricRange "True" 
     .SetTimeDomainFF "False" 
     .SetFrequency "10" 
     .SetTime "0" 
     .SetColorByValue "True" 
     .DrawStepLines "False" 
     .DrawIsoLongitudeLatitudeLines "False" 
     .ShowStructure "False" 
     .SetStructureTransparent "False" 
     .SetFarfieldTransparent "False" 
     .SetSpecials "enablepolarextralines" 
     .SetPlotMode "Directivity" 
     .Distance "1" 
     .UseFarfieldApproximation "True" 
     .SetScaleLinear "False" 
     .SetLogRange "40" 
     .SetLogNorm "0" 
     .DBUnit "0" 
     .EnableFixPlotMaximum "False" 
     .SetFixPlotMaximumValue "1.0" 
     .SetInverseAxialRatio "False" 
     .SetAxesType "user" 
     .Phistart "1.000000e+000", "0.000000e+000", "0.000000e+000" 
     .Thetastart "0.000000e+000", "0.000000e+000", "1.000000e+000" 
     .PolarizationVector "0.000000e+000", "1.000000e+000", "0.000000e+000" 
     .SetCoordinateSystemType "spherical" 
     .SetPolarizationType "Linear" 
     .SlantAngle 0.000000e+000 
     .Origin "bbox" 
     .Userorigin "0.000000e+000", "0.000000e+000", "0.000000e+000" 
     .SetUserDecouplingPlane "False" 
     .UseDecouplingPlane "False" 
     .DecouplingPlaneAxis "X" 
     .DecouplingPlanePosition "0.000000e+000" 
     .LossyGround "False" 
     .GroundEpsilon "1" 
     .GroundKappa "0" 
     .EnablePhaseCenterCalculation "False" 
     .SetPhaseCenterAngularLimit "3.000000e+001" 
     .SetPhaseCenterComponent "boresight" 
     .SetPhaseCenterPlane "both" 
     .ShowPhaseCenter "True" 
     .StoreSettings
End With

'@ define farfield monitor: farfield (f=frequency_centre)

'[VERSION]2013.1|23.0.0|20130516[/VERSION]
With Monitor 
     .Delete "farfield (f=11)" 
End With 
With Monitor 
     .Reset 
     .Name "farfield (f=frequency_centre)" 
     .Domain "Frequency" 
     .FieldType "Farfield" 
     .Frequency "frequency_centre" 
     .UseSubvolume "False" 
     .ExportFarfieldSource "False" 
     .SetSubvolume  "-7.07322826625",  "7.07322826625",  "-116.66420355869",  "117.85400483669",  "-12.9566552545",  "12.9566552545" 
     .Create 
End With

'@ define background

'[VERSION]2013.1|23.0.0|20130516[/VERSION]
With Background 
     .ResetBackground 
     .XminSpace "0.0" 
     .XmaxSpace "0.0" 
     .YminSpace "0.0" 
     .YmaxSpace "0.0" 
     .ZminSpace "0.0" 
     .ZmaxSpace "waveguide_width" 
     .ApplyInAllDirections "False" 
End With 
With Material 
     .Reset 
     .FrqType "all"
     .Type "Normal"
     .SetMaterialUnit "Hz", "m"
     .Epsilon "1.0"
     .Mue "1.0"
     .Sigma "0.0"
     .TanD "0.0"
     .TanDFreq "0.0"
     .TanDGiven "False"
     .TanDModel "ConstSigma"
     .ConstTanDModelOrderEps "1"
     .ReferenceCoordSystem "Global"
     .CoordSystemType "Cartesian"
     .SigmaM "0"
     .TanDM "0.0"
     .TanDMFreq "0.0"
     .TanDMGiven "False"
     .TanDMModel "ConstSigma"
     .ConstTanDModelOrderMue "1"
     .DispModelEps  "None"
     .DispModelMue "None"
     .DispersiveFittingSchemeEps "1st Order"
     .DispersiveFittingSchemeMue "1st Order"
     .UseGeneralDispersionEps "False"
     .UseGeneralDispersionMue "False"
     .NLAnisotropy "False"
     .NLAStackingFactor "1"
     .NLADirectionX "1"
     .NLADirectionY "0"
     .NLADirectionZ "0"
     .Rho "0.0"
     .ThermalType "Normal"
     .ThermalConductivity "0.0"
     .HeatCapacity "0.0"
     .MetabolicRate "0"
     .BloodFlow "0"
     .VoxelConvection "0"
     .MechanicsType "Unused"
     .Colour "0.6", "0.6", "0.6" 
     .Wireframe "False" 
     .Reflection "False" 
     .Allowoutline "True" 
     .Transparentoutline "False" 
     .Transparency "0" 
     .ChangeBackgroundMaterial
End With

'@ farfield plot options

'[VERSION]2013.1|23.0.0|20130516[/VERSION]
With FarfieldPlot 
     .Plottype "Cartesian" 
     .Vary "angle1" 
     .Theta "0" 
     .Phi "0" 
     .Step "0.2" 
     .Step2 "0.2" 
     .SetLockSteps "True" 
     .SetPlotRangeOnly "False" 
     .SetThetaStart "0" 
     .SetThetaEnd "180" 
     .SetPhiStart "0" 
     .SetPhiEnd "360" 
     .SetTheta360 "True" 
     .SymmetricRange "True" 
     .SetTimeDomainFF "False" 
     .SetFrequency "10" 
     .SetTime "0" 
     .SetColorByValue "True" 
     .DrawStepLines "False" 
     .DrawIsoLongitudeLatitudeLines "False" 
     .ShowStructure "False" 
     .SetStructureTransparent "False" 
     .SetFarfieldTransparent "False" 
     .SetSpecials "enablepolarextralines" 
     .SetPlotMode "Directivity" 
     .Distance "1" 
     .UseFarfieldApproximation "True" 
     .SetScaleLinear "False" 
     .SetLogRange "40" 
     .SetLogNorm "0" 
     .DBUnit "0" 
     .EnableFixPlotMaximum "False" 
     .SetFixPlotMaximumValue "1.0" 
     .SetInverseAxialRatio "False" 
     .SetAxesType "user" 
     .Phistart "1.000000e+000", "0.000000e+000", "0.000000e+000" 
     .Thetastart "0.000000e+000", "0.000000e+000", "1.000000e+000" 
     .PolarizationVector "0.000000e+000", "1.000000e+000", "0.000000e+000" 
     .SetCoordinateSystemType "spherical" 
     .SetPolarizationType "Linear" 
     .SlantAngle 0.000000e+000 
     .Origin "bbox" 
     .Userorigin "0.000000e+000", "0.000000e+000", "0.000000e+000" 
     .SetUserDecouplingPlane "False" 
     .UseDecouplingPlane "False" 
     .DecouplingPlaneAxis "X" 
     .DecouplingPlanePosition "0.000000e+000" 
     .LossyGround "False" 
     .GroundEpsilon "1" 
     .GroundKappa "0" 
     .EnablePhaseCenterCalculation "False" 
     .SetPhaseCenterAngularLimit "3.000000e+001" 
     .SetPhaseCenterComponent "boresight" 
     .SetPhaseCenterPlane "both" 
     .ShowPhaseCenter "True" 
     .StoreSettings
End With

'@ define background

'[VERSION]2013.1|23.0.0|20130516[/VERSION]
With Background 
     .ResetBackground 
     .XminSpace "0.0" 
     .XmaxSpace "0.0" 
     .YminSpace "0.0" 
     .YmaxSpace "0.0" 
     .ZminSpace "0.0" 
     .ZmaxSpace "0.0" 
     .ApplyInAllDirections "False" 
End With 
With Material 
     .Reset 
     .FrqType "all"
     .Type "Normal"
     .SetMaterialUnit "Hz", "m"
     .Epsilon "1.0"
     .Mue "1.0"
     .Sigma "0.0"
     .TanD "0.0"
     .TanDFreq "0.0"
     .TanDGiven "False"
     .TanDModel "ConstSigma"
     .ConstTanDModelOrderEps "1"
     .ReferenceCoordSystem "Global"
     .CoordSystemType "Cartesian"
     .SigmaM "0"
     .TanDM "0.0"
     .TanDMFreq "0.0"
     .TanDMGiven "False"
     .TanDMModel "ConstSigma"
     .ConstTanDModelOrderMue "1"
     .DispModelEps  "None"
     .DispModelMue "None"
     .DispersiveFittingSchemeEps "1st Order"
     .DispersiveFittingSchemeMue "1st Order"
     .UseGeneralDispersionEps "False"
     .UseGeneralDispersionMue "False"
     .NLAnisotropy "False"
     .NLAStackingFactor "1"
     .NLADirectionX "1"
     .NLADirectionY "0"
     .NLADirectionZ "0"
     .Rho "0.0"
     .ThermalType "Normal"
     .ThermalConductivity "0.0"
     .HeatCapacity "0.0"
     .MetabolicRate "0"
     .BloodFlow "0"
     .VoxelConvection "0"
     .MechanicsType "Unused"
     .Colour "0.6", "0.6", "0.6" 
     .Wireframe "False" 
     .Reflection "False" 
     .Allowoutline "True" 
     .Transparentoutline "False" 
     .Transparency "0" 
     .ChangeBackgroundMaterial
End With

'@ ___________Magus Anchor Point Creation___________

'[VERSION]2014.6|23.0.0|20090230[/VERSION]
            
        '[VERSION]2017.5|26.0.1|20170804[/VERSION]
        '@ execute macro: CreateMagusBoundaryAnchorPoints
        '[VERSION]2017.5|26.0.1|20170804[/VERSION]
        ' Extract and store the original boundary conditions
        Dim XminBoundaryType As String
        Dim XmaxBoundaryType As String
        Dim YminBoundaryType As String
        Dim YmaxBoundaryType As String
        Dim ZminBoundaryType As String
        Dim ZmaxBoundaryType As String
        XminBoundaryType = Boundary.GetXmin
        XmaxBoundaryType = Boundary.GetXmax
        YminBoundaryType = Boundary.GetYmin
        YmaxBoundaryType = Boundary.GetYmax
        ZminBoundaryType = Boundary.GetZmin
        ZmaxBoundaryType = Boundary.GetZmax
        ' Set the boundary to open in all directions
        Dim TightBoundary As String
        TightBoundary = "open"
        Boundary.Xmin(TightBoundary)
        Boundary.Xmax(TightBoundary)
        Boundary.Ymin(TightBoundary)
        Boundary.Ymax(TightBoundary)
        Boundary.Zmin(TightBoundary)
        Boundary.Zmax(TightBoundary)
        ' Setup WCS
        WCS.AlignWCSWithGlobalCoordinates
        ' Variables used to extract the "tight" bounding box
        Dim xmin As Double
        Dim xmax As Double
        Dim ymin As Double
        Dim ymax As Double
        Dim zmin As Double
        Dim zmax As Double
        Boundary.GetCalculationBox(xmin, xmax, ymin, ymax, zmin, zmax)
        ' Set the the original boundary conditions back to what they were
        Boundary.Xmin(XminBoundaryType)
        Boundary.Xmax(XmaxBoundaryType)
        Boundary.Ymin(YminBoundaryType)
        Boundary.Ymax(YmaxBoundaryType)
        Boundary.Zmin(ZminBoundaryType)
        Boundary.Zmax(ZmaxBoundaryType)
        ' Anchor Points
        Dim AnchorPointFolderName As String
        AnchorPointFolderName = "Boundary"
        ' Move the local WCS to the boundaries, orientate so that the normal points outward
        Dim du As Double
        Dim dv As Double
        Dim dw As Double
        ' Zmax
        du = 0.5*( xmin + xmax)
        dv = 0.5*( ymin + ymax)
        dw = zmax
        WCS.MoveWCS "local", du, dv, dw
        ' Set Zmax Anchor Point
        AnchorPoint.Store AnchorPointFolderName + ":" + "Zmax"
        ' Store WCS of current Anchor Point
        WCS.Store "Zmax"
        'Realign WCS with global
        WCS.AlignWCSWithGlobalCoordinates
        ' Zmin
        du = 0.5*( xmin + xmax)
        dv = 0.5*( ymin + ymax)
        dw = zmin
        WCS.MoveWCS "local", du, dv, dw
        WCS.SetNormal "0", "0", "-1"
        ' Set Zmin Anchor Point
        AnchorPoint.Store AnchorPointFolderName + ":" + "Zmin"
        ' Store WCS of current Anchor Point
        WCS.Store "Zmin"
        'Realign WCS with global
        WCS.AlignWCSWithGlobalCoordinates
        ' Xmax
        du = xmax
        dv = 0.5*( ymin + ymax)
        dw = 0.5*( zmin + zmax)
        WCS.MoveWCS "local", du, dv, dw
        WCS.SetNormal "1", "0", "0"
        ' Set Zmin Anchor Point
        AnchorPoint.Store AnchorPointFolderName + ":" + "Xmax"
        ' Store WCS of current Anchor Point
        WCS.Store "Xmax"
        'Realign WCS with global
        WCS.AlignWCSWithGlobalCoordinates
        ' Xmin
        du = xmin
        dv = 0.5*( ymin + ymax)
        dw = 0.5*( zmin + zmax)
        WCS.MoveWCS "local", du, dv, dw
        WCS.SetNormal "-1", "0", "0"
        ' Set Zmin Anchor Point
        AnchorPoint.Store AnchorPointFolderName + ":" + "Xmin"
        ' Store WCS of current Anchor Point
        WCS.Store "Xmin"
        'Realign WCS with global
        WCS.AlignWCSWithGlobalCoordinates
        ' Ymax
        du = 0.5*( xmin + xmax)
        dv = ymax
        dw = 0.5*( zmin + zmax)
        WCS.MoveWCS "local", du, dv, dw
        WCS.SetNormal "0", "1", "0"
        ' Set Zmin Anchor Point
        AnchorPoint.Store AnchorPointFolderName + ":" + "Ymax"
        ' Store WCS of current Anchor Point
        WCS.Store "Ymax"
        'Realign WCS with global
        WCS.AlignWCSWithGlobalCoordinates
        ' Ymin
        du = 0.5*( xmin + xmax)
        dv = ymin
        dw = 0.5*( zmin + zmax)
        WCS.MoveWCS "local", du, dv, dw
        WCS.SetNormal "0", "-1", "0"
        ' Set Zmin Anchor Point
        AnchorPoint.Store AnchorPointFolderName + ":" + "Ymin"
        ' Store WCS of current Anchor Point
        WCS.Store "Ymin"
        'Realign WCS with global
        WCS.AlignWCSWithGlobalCoordinates
        
      '@ ___________End: Magus Anchor Point Creation___________

'@ set mesh properties (for backward compatibility)

'[VERSION]2018.6|27.0.2|20180615[/VERSION]
With MeshSettings
     .SetMeshType "Tet"
     .Set "Version", 0%
     .SetMeshType "Srf"
     .Set "Version", 0%
End With

With MeshSettings 
    .SetMeshType "Hex"
    .Set "PlaneMergeVersion", 0
End With

'@ change solver type

'[VERSION]2018.6|27.0.2|20180615[/VERSION]
ChangeSolverType "HF Frequency Domain"

'@ set mesh properties (Tetrahedral)

'[VERSION]2018.6|27.0.2|20180615[/VERSION]
With Mesh 
     .MeshType "Tetrahedral" 
     .SetCreator "High Frequency"
End With 
With MeshSettings 
     .SetMeshType "Tet" 
     .Set "Version", 1%
     'MAX CELL - WAVELENGTH REFINEMENT 
     .Set "StepsPerWaveNear", "4" 
     .Set "StepsPerWaveFar", "4" 
     .Set "PhaseErrorNear", "0.02" 
     .Set "PhaseErrorFar", "0.02" 
     .Set "CellsPerWavelengthPolicy", "cellsperwavelength" 
     'MAX CELL - GEOMETRY REFINEMENT 
     .Set "StepsPerBoxNear", "10" 
     .Set "StepsPerBoxFar", "1" 
     .Set "ModelBoxDescrNear", "maxedge" 
     .Set "ModelBoxDescrFar", "maxedge" 
     'MIN CELL 
     .Set "UseRatioLimit", "0" 
     .Set "RatioLimit", "100" 
     .Set "MinStep", "0" 
     'MESHING METHOD 
     .SetMeshType "Unstr" 
     .Set "Method", "0" 
End With 
With MeshSettings 
     .SetMeshType "Tet" 
     .Set "CurvatureOrder", "1" 
     .Set "CurvatureOrderPolicy", "automatic" 
     .Set "CurvRefinementControl", "NormalTolerance" 
     .Set "NormalTolerance", "22.5" 
     .Set "SrfMeshGradation", "2" 
     .Set "SrfMeshOptimization", "1" 
End With 
With MeshSettings 
     .SetMeshType "Unstr" 
     .Set "UseMaterials",  "1" 
     .Set "MoveMesh", "0" 
End With 
With MeshSettings 
     .SetMeshType "Tet" 
     .Set "UseAnisoCurveRefinement", "1" 
     .Set "UseSameSrfAndVolMeshGradation", "1" 
     .Set "VolMeshGradation", "2" 
     .Set "VolMeshOptimization", "1" 
End With 
With MeshSettings 
     .SetMeshType "Unstr" 
     .Set "SmallFeatureSize", "0" 
     .Set "CoincidenceTolerance", "1e-06" 
     .Set "SelfIntersectionCheck", "1" 
     .Set "OptimizeForPlanarStructures", "0" 
End With 
With Mesh 
     .SetParallelMesherMode "Tet", "maximum" 
     .SetMaxParallelMesherThreads "Tet", "1" 
End With

'@ change solver type

'[VERSION]2018.6|27.0.2|20180615[/VERSION]
ChangeSolverType "HF Time Domain"

'@ Exported from Antenna Magus: Linear resonant slotted-waveguide array (narrow-wall slots) - Saturday, June 14, 2025

'[VERSION]2018.6|27.0.2|20090230[/VERSION]

'@ define time domain solver parameters

'[VERSION]2024.5|33.0.1|20240614[/VERSION]
Mesh.SetCreator "High Frequency" 

With Solver 
     .Method "Hexahedral"
     .CalculationType "TD-S"
     .StimulationPort "All"
     .StimulationMode "All"
     .SteadyStateLimit "-30"
     .MeshAdaption "False"
     .AutoNormImpedance "False"
     .NormingImpedance "50"
     .CalculateModesOnly "False"
     .SParaSymmetry "False"
     .StoreTDResultsInCache  "False"
     .RunDiscretizerOnly "False"
     .FullDeembedding "False"
     .SuperimposePLWExcitation "False"
     .UseSensitivityAnalysis "False"
End With

'@ define monitor: e-field (f=24;y=221.15156968695)

'[VERSION]2024.5|33.0.1|20240614[/VERSION]
With Monitor 
     .Reset 
     .Name "e-field (f=24;y=221.15156968695)" 
     .Dimension "Volume" 
     .Domain "Frequency" 
     .FieldType "Efield" 
     .MonitorValue "24" 
     .UseSubvolume "True" 
     .Coordinates "Structure" 
     .SetSubvolume "-2.4801255490365", "2.4801255490365", "-220.65581913791", "221.15156968695", "-4.9605942990365", "4.9605942990365" 
     .SetSubvolumeOffset "0.0", "0.0", "0.0", "0.0", "0.0", "0.0" 
     .SetSubvolumeInflateWithOffset "False" 
     .PlaneNormal "y" 
     .PlanePosition "221.15156968695" 
     .Create 
End With

'@ define time domain solver parameters

'[VERSION]2024.5|33.0.1|20240614[/VERSION]
Mesh.SetCreator "High Frequency" 

With Solver 
     .Method "Hexahedral"
     .CalculationType "TD-S"
     .StimulationPort "All"
     .StimulationMode "All"
     .SteadyStateLimit "-30"
     .MeshAdaption "False"
     .AutoNormImpedance "False"
     .NormingImpedance "50"
     .CalculateModesOnly "False"
     .SParaSymmetry "False"
     .StoreTDResultsInCache  "True"
     .RunDiscretizerOnly "False"
     .FullDeembedding "False"
     .SuperimposePLWExcitation "False"
     .UseSensitivityAnalysis "False"
End With

'@ define probe: 0

'[VERSION]2024.5|33.0.1|20240614[/VERSION]
With Probe
     .Reset 
     .ID "0" 
     .AutoLabel "True" 
     .Field "Efield" 
     .Orientation "All" 
     .Xpos "0.0" 
     .Ypos "0.0" 
     .Zpos "0.0" 
     .Create
End With

'@ delete monitor: e-field (f=24;y=221.15156968695)

'[VERSION]2024.5|33.0.1|20240614[/VERSION]
With Monitor 
     .Delete "e-field (f=24;y=221.15156968695)" 
End With

'@ define monitor: e-field (f=24;x=2.48012554903646)

'[VERSION]2024.5|33.0.1|20240614[/VERSION]
With Monitor 
     .Reset 
     .Name "e-field (f=24;x=2.48012554903646)" 
     .Dimension "Volume" 
     .Domain "Frequency" 
     .FieldType "Efield" 
     .MonitorValue "24" 
     .UseSubvolume "True" 
     .Coordinates "Structure" 
     .SetSubvolume "-2.48012554903646", "2.48012554903646", "-220.65581913791399", "221.15156968695047", "-4.96059429903646", "4.96059429903646" 
     .SetSubvolumeOffset "0.0", "0.0", "0.0", "0.0", "0.0", "0.0" 
     .SetSubvolumeInflateWithOffset "False" 
     .PlaneNormal "x" 
     .PlanePosition "2.48012554903646" 
     .Create 
End With

'@ delete monitor: e-field (f=24;x=2.48012554903646)

'[VERSION]2024.5|33.0.1|20240614[/VERSION]
With Monitor 
     .Delete "e-field (f=24;x=2.48012554903646)" 
End With

'@ define monitor: e-field (f=24;y=221.15156968695047)

'[VERSION]2024.5|33.0.1|20240614[/VERSION]
With Monitor 
     .Reset 
     .Name "e-field (f=24;y=221.15156968695047)" 
     .Dimension "Volume" 
     .Domain "Frequency" 
     .FieldType "Efield" 
     .MonitorValue "24" 
     .UseSubvolume "True" 
     .Coordinates "Structure" 
     .SetSubvolume "-2.48012554903646", "2.48012554903646", "-220.65581913791399", "221.15156968695047", "-4.96059429903646", "4.96059429903646" 
     .SetSubvolumeOffset "0.0", "0.0", "0.0", "0.0", "0.0", "0.0" 
     .SetSubvolumeInflateWithOffset "False" 
     .PlaneNormal "y" 
     .PlanePosition "221.15156968695047" 
     .Create 
End With

'@ delete monitor: e-field (f=24;y=221.15156968695047)

'[VERSION]2024.5|33.0.1|20240614[/VERSION]
With Monitor 
     .Delete "e-field (f=24;y=221.15156968695047)" 
End With

'@ define monitor: e-field (f=24;z=4.96059429903646)

'[VERSION]2024.5|33.0.1|20240614[/VERSION]
With Monitor 
     .Reset 
     .Name "e-field (f=24;z=4.96059429903646)" 
     .Dimension "Volume" 
     .Domain "Frequency" 
     .FieldType "Efield" 
     .MonitorValue "24" 
     .UseSubvolume "True" 
     .Coordinates "Structure" 
     .SetSubvolume "-2.48012554903646", "2.48012554903646", "-220.65581913791399", "221.15156968695047", "-4.96059429903646", "4.96059429903646" 
     .SetSubvolumeOffset "0.0", "0.0", "0.0", "0.0", "0.0", "0.0" 
     .SetSubvolumeInflateWithOffset "False" 
     .PlaneNormal "z" 
     .PlanePosition "4.96059429903646" 
     .Create 
End With

'@ delete monitor: e-field (f=24;z=4.96059429903646)

'[VERSION]2024.5|33.0.1|20240614[/VERSION]
With Monitor 
     .Delete "e-field (f=24;z=4.96059429903646)" 
End With

'@ define monitor: h-field (f=24;z=4.96059429903646)

'[VERSION]2024.5|33.0.1|20240614[/VERSION]
With Monitor 
     .Reset 
     .Name "h-field (f=24;z=4.96059429903646)" 
     .Dimension "Volume" 
     .Domain "Frequency" 
     .FieldType "Hfield" 
     .MonitorValue "24" 
     .UseSubvolume "True" 
     .Coordinates "Structure" 
     .SetSubvolume "-2.48012554903646", "2.48012554903646", "-220.65581913791399", "221.15156968695047", "-4.96059429903646", "4.96059429903646" 
     .SetSubvolumeOffset "0.0", "0.0", "0.0", "0.0", "0.0", "0.0" 
     .SetSubvolumeInflateWithOffset "False" 
     .PlaneNormal "z" 
     .PlanePosition "4.96059429903646" 
     .Create 
End With

'@ delete monitor: h-field (f=24;z=4.96059429903646)

'[VERSION]2024.5|33.0.1|20240614[/VERSION]
With Monitor 
     .Delete "h-field (f=24;z=4.96059429903646)" 
End With

'@ define monitor: e-field (f=24;z=4.96059429903646)

'[VERSION]2024.5|33.0.1|20240614[/VERSION]
With Monitor 
     .Reset 
     .Name "e-field (f=24;z=4.96059429903646)" 
     .Dimension "Volume" 
     .Domain "Frequency" 
     .FieldType "Efield" 
     .MonitorValue "24" 
     .UseSubvolume "True" 
     .Coordinates "Structure" 
     .SetSubvolume "-2.48012554903646", "2.48012554903646", "-220.65581913791399", "221.15156968695047", "-4.96059429903646", "4.96059429903646" 
     .SetSubvolumeOffset "0.0", "0.0", "0.0", "0.0", "0.0", "0.0" 
     .SetSubvolumeInflateWithOffset "False" 
     .PlaneNormal "z" 
     .PlanePosition "4.96059429903646" 
     .Create 
End With

'@ delete monitor: e-field (f=24;z=4.96059429903646)

'[VERSION]2024.5|33.0.1|20240614[/VERSION]
With Monitor 
     .Delete "e-field (f=24;z=4.96059429903646)" 
End With

'@ define monitor: e-field (f=24;z=3)

'[VERSION]2024.5|33.0.1|20240614[/VERSION]
With Monitor 
     .Reset 
     .Name "e-field (f=24;z=3)" 
     .Dimension "Volume" 
     .Domain "Frequency" 
     .FieldType "Efield" 
     .MonitorValue "24" 
     .UseSubvolume "True" 
     .Coordinates "Structure" 
     .SetSubvolume "-2.48012554903646", "2.48012554903646", "-220.65581913791399", "221.15156968695047", "-4.96059429903646", "4.96059429903646" 
     .SetSubvolumeOffset "0.0", "0.0", "0.0", "0.0", "0.0", "0.0" 
     .SetSubvolumeInflateWithOffset "False" 
     .PlaneNormal "z" 
     .PlanePosition "3" 
     .Create 
End With

'@ delete monitor: e-field (f=24;z=3)

'[VERSION]2024.5|33.0.1|20240614[/VERSION]
With Monitor 
     .Delete "e-field (f=24;z=3)" 
End With

'@ define monitor: e-field (f=24;z=4)

'[VERSION]2024.5|33.0.1|20240614[/VERSION]
With Monitor 
     .Reset 
     .Name "e-field (f=24;z=4)" 
     .Dimension "Volume" 
     .Domain "Frequency" 
     .FieldType "Efield" 
     .MonitorValue "24" 
     .UseSubvolume "True" 
     .Coordinates "Structure" 
     .SetSubvolume "-2.48012554903646", "2.48012554903646", "-220.65581913791399", "221.15156968695047", "-4.96059429903646", "4.96059429903646" 
     .SetSubvolumeOffset "0.0", "0.0", "0.0", "0.0", "0.0", "0.0" 
     .SetSubvolumeInflateWithOffset "False" 
     .PlaneNormal "z" 
     .PlanePosition "4" 
     .Create 
End With

'@ delete monitor: e-field (f=24;z=4)

'[VERSION]2024.5|33.0.1|20240614[/VERSION]
With Monitor 
     .Delete "e-field (f=24;z=4)" 
End With

'@ define monitor: h-field (f=24;z=4)

'[VERSION]2024.5|33.0.1|20240614[/VERSION]
With Monitor 
     .Reset 
     .Name "h-field (f=24;z=4)" 
     .Dimension "Volume" 
     .Domain "Frequency" 
     .FieldType "Hfield" 
     .MonitorValue "24" 
     .UseSubvolume "True" 
     .Coordinates "Structure" 
     .SetSubvolume "-2.48012554903646", "2.48012554903646", "-220.65581913791399", "221.15156968695047", "-4.96059429903646", "4.96059429903646" 
     .SetSubvolumeOffset "0.0", "0.0", "0.0", "0.0", "0.0", "0.0" 
     .SetSubvolumeInflateWithOffset "False" 
     .PlaneNormal "z" 
     .PlanePosition "4" 
     .Create 
End With

'@ delete monitor: h-field (f=24;z=4)

'[VERSION]2024.5|33.0.1|20240614[/VERSION]
With Monitor 
     .Delete "h-field (f=24;z=4)" 
End With

'@ define monitor: e-field (f=24;z=4)

'[VERSION]2024.5|33.0.1|20240614[/VERSION]
With Monitor 
     .Reset 
     .Name "e-field (f=24;z=4)" 
     .Dimension "Volume" 
     .Domain "Frequency" 
     .FieldType "Efield" 
     .MonitorValue "24" 
     .UseSubvolume "True" 
     .Coordinates "Structure" 
     .SetSubvolume "-2.48012554903646", "2.48012554903646", "-220.65581913791399", "221.15156968695047", "-4.96059429903646", "4.96059429903646" 
     .SetSubvolumeOffset "0.0", "0.0", "0.0", "0.0", "0.0", "0.0" 
     .SetSubvolumeInflateWithOffset "False" 
     .PlaneNormal "z" 
     .PlanePosition "4" 
     .Create 
End With

'@ delete probes

'[VERSION]2024.5|33.0.1|20240614[/VERSION]
With Probe
   .DeleteById "0"
End With

'@ define monitor: e-field (f=24;x=2.4801255490365)

'[VERSION]2024.5|33.0.1|20240614[/VERSION]
With Monitor 
     .Reset 
     .Name "e-field (f=24;x=2.4801255490365)" 
     .Dimension "Volume" 
     .Domain "Frequency" 
     .FieldType "Efield" 
     .MonitorValue "24" 
     .UseSubvolume "True" 
     .Coordinates "Structure" 
     .SetSubvolume "-2.4801255490365", "2.4801255490365", "-220.65581913791", "221.15156968695", "-4.9605942990365", "4.9605942990365" 
     .SetSubvolumeOffset "0.0", "0.0", "0.0", "0.0", "0.0", "0.0" 
     .SetSubvolumeInflateWithOffset "False" 
     .PlaneNormal "x" 
     .PlanePosition "2.4801255490365" 
     .Create 
End With

'@ define monitor: e-field (f=24;z=4.9605942990365)

'[VERSION]2024.5|33.0.1|20240614[/VERSION]
With Monitor 
     .Reset 
     .Name "e-field (f=24;z=4.9605942990365)" 
     .Dimension "Volume" 
     .Domain "Frequency" 
     .FieldType "Efield" 
     .MonitorValue "24" 
     .UseSubvolume "True" 
     .Coordinates "Structure" 
     .SetSubvolume "-2.4801255490365", "2.4801255490365", "-220.65581913791", "221.15156968695", "-4.9605942990365", "4.9605942990365" 
     .SetSubvolumeOffset "0.0", "0.0", "0.0", "0.0", "0.0", "0.0" 
     .SetSubvolumeInflateWithOffset "False" 
     .PlaneNormal "z" 
     .PlanePosition "4.9605942990365" 
     .Create 
End With

'@ delete monitor: e-field (f=24;z=4.9605942990365)

'[VERSION]2024.5|33.0.1|20240614[/VERSION]
With Monitor 
     .Delete "e-field (f=24;z=4.9605942990365)" 
End With

'@ define monitor: e-field (f=24;x=2.48012554903646)

'[VERSION]2024.5|33.0.1|20240614[/VERSION]
With Monitor 
     .Reset 
     .Name "e-field (f=24;x=2.48012554903646)" 
     .Dimension "Volume" 
     .Domain "Frequency" 
     .FieldType "Efield" 
     .MonitorValue "24" 
     .UseSubvolume "True" 
     .Coordinates "Structure" 
     .SetSubvolume "-2.48012554903646", "2.48012554903646", "-220.65581913791399", "221.15156968695047", "-4.96059429903646", "4.96059429903646" 
     .SetSubvolumeOffset "0.0", "0.0", "0.0", "0.0", "0.0", "0.0" 
     .SetSubvolumeInflateWithOffset "False" 
     .PlaneNormal "x" 
     .PlanePosition "2.48012554903646" 
     .Create 
End With

'@ delete monitor: e-field (f=24;x=2.48012554903646)

'[VERSION]2024.5|33.0.1|20240614[/VERSION]
Monitor.Delete "e-field (f=24;x=2.48012554903646)"

'@ delete monitor: e-field (f=24;x=2.4801255490365)

'[VERSION]2024.5|33.0.1|20240614[/VERSION]
Monitor.Delete "e-field (f=24;x=2.4801255490365)"

'@ delete monitor: e-field (f=24;z=4)

'[VERSION]2024.5|33.0.1|20240614[/VERSION]
Monitor.Delete "e-field (f=24;z=4)"

'@ define monitor: e-field (f=24;x=2.4801255490365)

'[VERSION]2024.5|33.0.1|20240614[/VERSION]
With Monitor 
     .Reset 
     .Name "e-field (f=24;x=2.4801255490365)" 
     .Dimension "Volume" 
     .Domain "Frequency" 
     .FieldType "Efield" 
     .MonitorValue "24" 
     .UseSubvolume "True" 
     .Coordinates "Structure" 
     .SetSubvolume "-2.4801255490365", "2.4801255490365", "-220.65581913791", "221.15156968695", "-4.9605942990365", "4.9605942990365" 
     .SetSubvolumeOffset "0.0", "0.0", "0.0", "0.0", "0.0", "0.0" 
     .SetSubvolumeInflateWithOffset "False" 
     .PlaneNormal "x" 
     .PlanePosition "2.4801255490365" 
     .Create 
End With

'@ define monitor: e-field (f=24;y=221.15156968695)

'[VERSION]2024.5|33.0.1|20240614[/VERSION]
With Monitor 
     .Reset 
     .Name "e-field (f=24;y=221.15156968695)" 
     .Dimension "Volume" 
     .Domain "Frequency" 
     .FieldType "Efield" 
     .MonitorValue "24" 
     .UseSubvolume "True" 
     .Coordinates "Structure" 
     .SetSubvolume "-2.4801255490365", "2.4801255490365", "-220.65581913791", "221.15156968695", "-4.9605942990365", "4.9605942990365" 
     .SetSubvolumeOffset "0.0", "0.0", "0.0", "0.0", "0.0", "0.0" 
     .SetSubvolumeInflateWithOffset "False" 
     .PlaneNormal "y" 
     .PlanePosition "221.15156968695" 
     .Create 
End With

'@ define monitor: e-field (f=24;z=4.9605942990365)

'[VERSION]2024.5|33.0.1|20240614[/VERSION]
With Monitor 
     .Reset 
     .Name "e-field (f=24;z=4.9605942990365)" 
     .Dimension "Volume" 
     .Domain "Frequency" 
     .FieldType "Efield" 
     .MonitorValue "24" 
     .UseSubvolume "True" 
     .Coordinates "Structure" 
     .SetSubvolume "-2.4801255490365", "2.4801255490365", "-220.65581913791", "221.15156968695", "-4.9605942990365", "4.9605942990365" 
     .SetSubvolumeOffset "0.0", "0.0", "0.0", "0.0", "0.0", "0.0" 
     .SetSubvolumeInflateWithOffset "False" 
     .PlaneNormal "z" 
     .PlanePosition "4.9605942990365" 
     .Create 
End With

'@ define monitor: h-field (f=24;x=2.4801255490365)

'[VERSION]2024.5|33.0.1|20240614[/VERSION]
With Monitor 
     .Reset 
     .Name "h-field (f=24;x=2.4801255490365)" 
     .Dimension "Volume" 
     .Domain "Frequency" 
     .FieldType "Hfield" 
     .MonitorValue "24" 
     .UseSubvolume "True" 
     .Coordinates "Structure" 
     .SetSubvolume "-2.4801255490365", "2.4801255490365", "-220.65581913791", "221.15156968695", "-4.9605942990365", "4.9605942990365" 
     .SetSubvolumeOffset "0.0", "0.0", "0.0", "0.0", "0.0", "0.0" 
     .SetSubvolumeInflateWithOffset "False" 
     .PlaneNormal "x" 
     .PlanePosition "2.4801255490365" 
     .Create 
End With

'@ define monitor: h-field (f=24;y=221.15156968695)

'[VERSION]2024.5|33.0.1|20240614[/VERSION]
With Monitor 
     .Reset 
     .Name "h-field (f=24;y=221.15156968695)" 
     .Dimension "Volume" 
     .Domain "Frequency" 
     .FieldType "Hfield" 
     .MonitorValue "24" 
     .UseSubvolume "True" 
     .Coordinates "Structure" 
     .SetSubvolume "-2.4801255490365", "2.4801255490365", "-220.65581913791", "221.15156968695", "-4.9605942990365", "4.9605942990365" 
     .SetSubvolumeOffset "0.0", "0.0", "0.0", "0.0", "0.0", "0.0" 
     .SetSubvolumeInflateWithOffset "False" 
     .PlaneNormal "y" 
     .PlanePosition "221.15156968695" 
     .Create 
End With

'@ define monitor: h-field (f=24;z=4.9605942990365)

'[VERSION]2024.5|33.0.1|20240614[/VERSION]
With Monitor 
     .Reset 
     .Name "h-field (f=24;z=4.9605942990365)" 
     .Dimension "Volume" 
     .Domain "Frequency" 
     .FieldType "Hfield" 
     .MonitorValue "24" 
     .UseSubvolume "True" 
     .Coordinates "Structure" 
     .SetSubvolume "-2.4801255490365", "2.4801255490365", "-220.65581913791", "221.15156968695", "-4.9605942990365", "4.9605942990365" 
     .SetSubvolumeOffset "0.0", "0.0", "0.0", "0.0", "0.0", "0.0" 
     .SetSubvolumeInflateWithOffset "False" 
     .PlaneNormal "z" 
     .PlanePosition "4.9605942990365" 
     .Create 
End With

'@ define farfield monitor: farfield (f=24)

'[VERSION]2024.5|33.0.1|20240614[/VERSION]
With Monitor 
     .Reset 
     .Name "farfield (f=24)" 
     .Domain "Frequency" 
     .FieldType "Farfield" 
     .MonitorValue "24" 
     .ExportFarfieldSource "False" 
     .UseSubvolume "False" 
     .Coordinates "Structure" 
     .SetSubvolume "-2.4801255490365", "2.4801255490365", "-220.65581913791", "221.15156968695", "-4.9605942990365", "4.9605942990365" 
     .SetSubvolumeOffset "10", "10", "10", "10", "10", "10" 
     .SetSubvolumeInflateWithOffset "False" 
     .SetSubvolumeOffsetType "FractionOfWavelength" 
     .EnableNearfieldCalculation "True" 
     .Create 
End With

'@ define monitor: surface-current (f=24)

'[VERSION]2024.5|33.0.1|20240614[/VERSION]
With Monitor 
     .Reset 
     .Name "surface-current (f=24)" 
     .Dimension "Volume" 
     .Domain "Frequency" 
     .FieldType "Surfacecurrent" 
     .MonitorValue "24" 
     .Create 
End With

'@ define material: PEC

'[VERSION]2024.5|33.0.1|20240614[/VERSION]
With Material
     .Reset
     .Name "PEC"
     .Folder ""
     .FrqType "all"
     .Type "PEC"
     .SetMaterialUnit "Hz", "mm"
     .Epsilon "1"
     .Mu "1"
     .Rho "0"
     .ThermalType "PTC"
     .SetActiveMaterial "all"
     .Colour "0.8", "0.8", "0.8"
     .Wireframe "False"
     .Transparency "0"
     .Create
End With

'@ define material: Silver

'[VERSION]2024.5|33.0.1|20240614[/VERSION]
With Material
     .Reset
     .Name "Silver"
     .Folder ""
     .FrqType "static"
     .Type "Normal"
     .SetMaterialUnit "Hz", "mm"
     .Epsilon "1"
     .Mu "1.0"
     .Kappa "6.3012e007"
     .TanD "0.0"
     .TanDFreq "0.0"
     .TanDGiven "False"
     .TanDModel "ConstTanD"
     .KappaM "0"
     .TanDM "0.0"
     .TanDMFreq "0.0"
     .TanDMGiven "False"
     .TanDMModel "ConstTanD"
     .DispModelEps "None"
     .DispModelMu "None"
     .DispersiveFittingSchemeEps "General 1st"
     .DispersiveFittingSchemeMu "General 1st"
     .UseGeneralDispersionEps "False"
     .UseGeneralDispersionMu "False"
     .FrqType "all"
     .Type "Lossy metal"
     .MaterialUnit "Frequency", "GHz"
     .MaterialUnit "Geometry", "mm"
     .MaterialUnit "Time", "s"
     .MaterialUnit "Temperature", "Kelvin"
     .Mu "1.0"
     .Sigma "6.3012e007"
     .Rho "10500.0"
     .ThermalType "Normal"
     .ThermalConductivity "429"
     .SpecificHeat "230", "J/K/kg"
     .MetabolicRate "0"
     .BloodFlow "0"
     .VoxelConvection "0"
     .MechanicsType "Isotropic"
     .YoungsModulus "76"
     .PoissonsRatio "0.37"
     .ThermalExpansionRate "20"
     .ReferenceCoordSystem "Global"
     .CoordSystemType "Cartesian"
     .NLAnisotropy "False"
     .NLAStackingFactor "1"
     .NLADirectionX "1"
     .NLADirectionY "0"
     .NLADirectionZ "0"
     .Colour "1", "1", "0"
     .Wireframe "False"
     .Reflection "False"
     .Allowoutline "True"
     .Transparentoutline "False"
     .Transparency "0"
     .Create
End With

'@ delete material: Silver

'[VERSION]2024.5|33.0.1|20240614[/VERSION]
Material.Delete "Silver"

'@ define material: Silicon (loss free)

'[VERSION]2024.5|33.0.1|20240614[/VERSION]
With Material
     .Reset
     .Name "Silicon (loss free)"
     .Folder ""
     .FrqType "all"
     .Type "Normal"
     .SetMaterialUnit "GHz", "mm"
     .Epsilon "11.9"
     .Mu "1.0"
     .Kappa "0.0"
     .TanD "0.0"
     .TanDFreq "0.0"
     .TanDGiven "False"
     .TanDModel "ConstTanD"
     .KappaM "0.0"
     .TanDM "0.0"
     .TanDMFreq "0.0"
     .TanDMGiven "False"
     .TanDMModel "ConstKappa"
     .DispModelEps "None"
     .DispModelMu "None"
     .DispersiveFittingSchemeEps "General 1st"
     .DispersiveFittingSchemeMu "General 1st"
     .UseGeneralDispersionEps "False"
     .UseGeneralDispersionMu "False"
     .Rho "2330.0"
     .ThermalType "Normal"
     .ThermalConductivity "148"
     .SpecificHeat "700", "J/K/kg"
     .SetActiveMaterial "all"
     .MechanicsType "Isotropic"
     .YoungsModulus "112"
     .PoissonsRatio "0.28"
     .ThermalExpansionRate "5.1"
     .Colour "0.75", "0.95", "0.85"
     .Wireframe "False"
     .Transparency "0"
     .Create
End With

'@ define material: PEC

'[VERSION]2024.5|33.0.1|20240614[/VERSION]
With Material
     .Reset
     .Name "PEC"
     .Folder ""
     .FrqType "all"
     .Type "PEC"
     .SetMaterialUnit "Hz", "mm"
     .Epsilon "1"
     .Mu "1"
     .Rho "0"
     .ThermalType "PTC"
     .SetActiveMaterial "all"
     .Colour "0.8", "0.8", "0.8"
     .Wireframe "False"
     .Transparency "0"
     .Create
End With

'@ define material: Silver

'[VERSION]2024.5|33.0.1|20240614[/VERSION]
With Material
     .Reset
     .Name "Silver"
     .Folder ""
     .FrqType "static"
     .Type "Normal"
     .SetMaterialUnit "Hz", "mm"
     .Epsilon "1"
     .Mu "1.0"
     .Kappa "6.3012e007"
     .TanD "0.0"
     .TanDFreq "0.0"
     .TanDGiven "False"
     .TanDModel "ConstTanD"
     .KappaM "0"
     .TanDM "0.0"
     .TanDMFreq "0.0"
     .TanDMGiven "False"
     .TanDMModel "ConstTanD"
     .DispModelEps "None"
     .DispModelMu "None"
     .DispersiveFittingSchemeEps "General 1st"
     .DispersiveFittingSchemeMu "General 1st"
     .UseGeneralDispersionEps "False"
     .UseGeneralDispersionMu "False"
     .FrqType "all"
     .Type "Lossy metal"
     .MaterialUnit "Frequency", "GHz"
     .MaterialUnit "Geometry", "mm"
     .MaterialUnit "Time", "s"
     .MaterialUnit "Temperature", "Kelvin"
     .Mu "1.0"
     .Sigma "6.3012e007"
     .Rho "10500.0"
     .ThermalType "Normal"
     .ThermalConductivity "429"
     .SpecificHeat "230", "J/K/kg"
     .MetabolicRate "0"
     .BloodFlow "0"
     .VoxelConvection "0"
     .MechanicsType "Isotropic"
     .YoungsModulus "76"
     .PoissonsRatio "0.37"
     .ThermalExpansionRate "20"
     .ReferenceCoordSystem "Global"
     .CoordSystemType "Cartesian"
     .NLAnisotropy "False"
     .NLAStackingFactor "1"
     .NLADirectionX "1"
     .NLADirectionY "0"
     .NLADirectionZ "0"
     .Colour "1", "1", "0"
     .Wireframe "False"
     .Reflection "False"
     .Allowoutline "True"
     .Transparentoutline "False"
     .Transparency "0"
     .Create
End With

'@ change material: antenna:waveguide to: Silver

'[VERSION]2024.5|33.0.1|20240614[/VERSION]
Solid.ChangeMaterial "antenna:waveguide", "Silver"

'@ delete material: Silicon (loss free)

'[VERSION]2024.5|33.0.1|20240614[/VERSION]
Material.Delete "Silicon (loss free)"

'@ delete material: PEC

'[VERSION]2024.5|33.0.1|20240614[/VERSION]
Material.Delete "PEC"

'@ farfield plot options

'[VERSION]2024.5|33.0.1|20240614[/VERSION]
With FarfieldPlot 
     .Plottype "Polar" 
     .Vary "angle1" 
     .Theta "90" 
     .Phi "90" 
     .Step "0.2" 
     .Step2 "0.2" 
     .SetLockSteps "True" 
     .SetPlotRangeOnly "False" 
     .SetThetaStart "0" 
     .SetThetaEnd "180" 
     .SetPhiStart "0" 
     .SetPhiEnd "360" 
     .SetTheta360 "True" 
     .SymmetricRange "True" 
     .SetTimeDomainFF "False" 
     .SetFrequency "10" 
     .SetTime "0" 
     .SetColorByValue "True" 
     .DrawStepLines "False" 
     .DrawIsoLongitudeLatitudeLines "False" 
     .ShowStructure "True" 
     .ShowStructureProfile "True" 
     .SetStructureTransparent "False" 
     .SetFarfieldTransparent "False" 
     .AspectRatio "Free" 
     .ShowGridlines "True" 
     .InvertAxes "False", "False" 
     .SetSpecials "enablepolarextralines" 
     .SetPlotMode "Directivity" 
     .Distance "1" 
     .UseFarfieldApproximation "True" 
     .IncludeUnitCellSidewalls "True" 
     .SetScaleLinear "False" 
     .SetLogRange "40" 
     .SetLogNorm "0" 
     .DBUnit "0" 
     .SetMaxReferenceMode "abs" 
     .EnableFixPlotMaximum "False" 
     .SetFixPlotMaximumValue "1.0" 
     .SetInverseAxialRatio "False" 
     .SetAxesType "user" 
     .SetAntennaType "unknown" 
     .Phistart "1.000000e+00", "0.000000e+00", "0.000000e+00" 
     .Thetastart "0.000000e+00", "0.000000e+00", "1.000000e+00" 
     .PolarizationVector "0.000000e+00", "1.000000e+00", "0.000000e+00" 
     .SetCoordinateSystemType "spherical" 
     .SetAutomaticCoordinateSystem "True" 
     .SetPolarizationType "Linear" 
     .SlantAngle 0.000000e+00 
     .Origin "bbox" 
     .Userorigin "0.000000e+00", "0.000000e+00", "0.000000e+00" 
     .SetUserDecouplingPlane "False" 
     .UseDecouplingPlane "False" 
     .DecouplingPlaneAxis "X" 
     .DecouplingPlanePosition "0.000000e+00" 
     .LossyGround "False" 
     .GroundEpsilon "1" 
     .GroundKappa "0" 
     .EnablePhaseCenterCalculation "False" 
     .SetPhaseCenterAngularLimit "3.000000e+01" 
     .SetPhaseCenterComponent "boresight" 
     .SetPhaseCenterPlane "both" 
     .ShowPhaseCenter "True" 
     .ClearCuts 

     .StoreSettings
End With

'@ transform: scale antenna:waveguide

'[VERSION]2024.5|33.0.1|20240614[/VERSION]
With Transform 
     .Reset 
     .Name "antenna:waveguide" 
     .Origin "Free" 
     .Center "0", "0", "0" 
     .ScaleFactor "1", "0.9925833", "1" 
     .MultipleObjects "False" 
     .GroupObjects "False" 
     .Repetitions "1" 
     .MultipleSelection "False" 
     .AutoDestination "True" 
     .Transform "Shape", "Scale" 
End With

'@ pick face

'[VERSION]2024.5|33.0.1|20240614[/VERSION]
Pick.PickFaceFromId "port1", "1"

'@ delete picked face

'[VERSION]2024.5|33.0.1|20240614[/VERSION]
Pick.DeleteFace "-1"

'@ pick face

'[VERSION]2024.5|33.0.1|20240614[/VERSION]
Pick.PickFaceFromId "antenna:waveguide", "309"

'@ delete picked face

'[VERSION]2024.5|33.0.1|20240614[/VERSION]
Pick.DeleteFace "-1"

'@ pick mid point

'[VERSION]2024.5|33.0.1|20240614[/VERSION]
Pick.PickMidpointFromId "antenna:waveguide", "609"

'@ pick mid point

'[VERSION]2024.5|33.0.1|20240614[/VERSION]
Pick.PickMidpointFromId "antenna:waveguide", "610"

'@ delete picked point

'[VERSION]2024.5|33.0.1|20240614[/VERSION]
Pick.DeletePoint "-1"

'@ delete picked point

'[VERSION]2024.5|33.0.1|20240614[/VERSION]
Pick.DeletePoint "-1"

'@ clear picks

'[VERSION]2024.5|33.0.1|20240614[/VERSION]
Pick.ClearAllPicks

'@ pick face

'[VERSION]2024.5|33.0.1|20240614[/VERSION]
Pick.PickFaceFromId "antenna:waveguide", "309"

'@ define port: 2

'[VERSION]2024.5|33.0.1|20240614[/VERSION]
With Port 
     .Reset 
     .PortNumber "2" 
     .Label ""
     .Folder ""
     .NumberOfModes "1"
     .AdjustPolarization "False"
     .PolarizationAngle "0.0"
     .ReferencePlaneDistance "0"
     .TextSize "50"
     .TextMaxLimit "1"
     .Coordinates "Picks"
     .Orientation "positive"
     .PortOnBound "False"
     .ClipPickedPortToBound "False"
     .Xrange "-2.4801255490365", "2.4801255490365"
     .Yrange "-219.01928112411", "-219.01928112411"
     .Zrange "-4.9605942990365", "4.9605942990365"
     .XrangeAdd "0.0", "0.0"
     .YrangeAdd "0.0", "0.0"
     .ZrangeAdd "0.0", "0.0"
     .SingleEnded "False"
     .WaveguideMonitor "False"
     .Create 
End With

'@ delete port: port1

'[VERSION]2024.5|33.0.1|20240614[/VERSION]
Port.Delete "1"

'@ farfield plot options

'[VERSION]2024.5|33.0.1|20240614[/VERSION]
With FarfieldPlot 
     .Plottype "Polar" 
     .Vary "angle1" 
     .Theta "0" 
     .Phi "0" 
     .Step "0.2" 
     .Step2 "0.2" 
     .SetLockSteps "True" 
     .SetPlotRangeOnly "False" 
     .SetThetaStart "0" 
     .SetThetaEnd "180" 
     .SetPhiStart "0" 
     .SetPhiEnd "360" 
     .SetTheta360 "True" 
     .SymmetricRange "True" 
     .SetTimeDomainFF "False" 
     .SetFrequency "24" 
     .SetTime "0" 
     .SetColorByValue "True" 
     .DrawStepLines "False" 
     .DrawIsoLongitudeLatitudeLines "False" 
     .ShowStructure "True" 
     .ShowStructureProfile "True" 
     .SetStructureTransparent "False" 
     .SetFarfieldTransparent "False" 
     .AspectRatio "Free" 
     .ShowGridlines "True" 
     .InvertAxes "False", "False" 
     .SetSpecials "enablepolarextralines" 
     .SetPlotMode "Gain" 
     .Distance "1" 
     .UseFarfieldApproximation "True" 
     .IncludeUnitCellSidewalls "True" 
     .SetScaleLinear "False" 
     .SetLogRange "40" 
     .SetLogNorm "0" 
     .DBUnit "0" 
     .SetMaxReferenceMode "abs" 
     .EnableFixPlotMaximum "False" 
     .SetFixPlotMaximumValue "1.0" 
     .SetInverseAxialRatio "False" 
     .SetAxesType "xyz" 
     .SetAntennaType "unknown" 
     .Phistart "1.000000e+00", "0.000000e+00", "0.000000e+00" 
     .Thetastart "0.000000e+00", "0.000000e+00", "1.000000e+00" 
     .PolarizationVector "0.000000e+00", "1.000000e+00", "0.000000e+00" 
     .SetCoordinateSystemType "ludwig3" 
     .SetAutomaticCoordinateSystem "True" 
     .SetPolarizationType "Linear" 
     .SlantAngle 4.500000e+01 
     .Origin "bbox" 
     .Userorigin "0.000000e+00", "0.000000e+00", "0.000000e+00" 
     .SetUserDecouplingPlane "False" 
     .UseDecouplingPlane "False" 
     .DecouplingPlaneAxis "X" 
     .DecouplingPlanePosition "0.000000e+00" 
     .LossyGround "False" 
     .GroundEpsilon "1" 
     .GroundKappa "0" 
     .EnablePhaseCenterCalculation "False" 
     .SetPhaseCenterAngularLimit "3.000000e+01" 
     .SetPhaseCenterComponent "boresight" 
     .SetPhaseCenterPlane "both" 
     .ShowPhaseCenter "True" 
     .ClearCuts 

     .StoreSettings
End With

'@ transform: scale antenna:waveguide

'[VERSION]2024.0|33.0.1|20230901[/VERSION]
With Transform 
     .Reset 
     .Name "antenna:waveguide" 
     .Origin "Free" 
     .Center "0", "0", "0" 
     .ScaleFactor "0.996416666", "0.996416666", "0.996416666" 
     .MultipleObjects "False" 
     .GroupObjects "False" 
     .Repetitions "1" 
     .MultipleSelection "False" 
     .AutoDestination "True" 
     .Transform "Shape", "Scale" 
End With

'@ farfield plot options

'[VERSION]2024.0|33.0.1|20230901[/VERSION]
With FarfieldPlot 
     .Plottype "Polar" 
     .Vary "angle1" 
     .Theta "90" 
     .Phi "90" 
     .Step "0.2" 
     .Step2 "0.2" 
     .SetLockSteps "True" 
     .SetPlotRangeOnly "False" 
     .SetThetaStart "0" 
     .SetThetaEnd "180" 
     .SetPhiStart "0" 
     .SetPhiEnd "360" 
     .SetTheta360 "True" 
     .SymmetricRange "True" 
     .SetTimeDomainFF "False" 
     .SetFrequency "24" 
     .SetTime "0" 
     .SetColorByValue "True" 
     .DrawStepLines "False" 
     .DrawIsoLongitudeLatitudeLines "False" 
     .ShowStructure "True" 
     .ShowStructureProfile "True" 
     .SetStructureTransparent "False" 
     .SetFarfieldTransparent "False" 
     .AspectRatio "Free" 
     .ShowGridlines "True" 
     .InvertAxes "False", "False" 
     .SetSpecials "enablepolarextralines" 
     .SetPlotMode "Gain" 
     .Distance "1" 
     .UseFarfieldApproximation "True" 
     .IncludeUnitCellSidewalls "True" 
     .SetScaleLinear "False" 
     .SetLogRange "40" 
     .SetLogNorm "0" 
     .DBUnit "0" 
     .SetMaxReferenceMode "abs" 
     .EnableFixPlotMaximum "False" 
     .SetFixPlotMaximumValue "1.0" 
     .SetInverseAxialRatio "False" 
     .SetAxesType "xyz" 
     .SetAntennaType "unknown" 
     .Phistart "1.000000e+00", "0.000000e+00", "0.000000e+00" 
     .Thetastart "0.000000e+00", "0.000000e+00", "1.000000e+00" 
     .PolarizationVector "0.000000e+00", "1.000000e+00", "0.000000e+00" 
     .SetCoordinateSystemType "spherical" 
     .SetAutomaticCoordinateSystem "True" 
     .SetPolarizationType "Linear" 
     .SlantAngle 4.500000e+01 
     .Origin "bbox" 
     .Userorigin "0.000000e+00", "0.000000e+00", "0.000000e+00" 
     .SetUserDecouplingPlane "False" 
     .UseDecouplingPlane "False" 
     .DecouplingPlaneAxis "X" 
     .DecouplingPlanePosition "0.000000e+00" 
     .LossyGround "False" 
     .GroundEpsilon "1" 
     .GroundKappa "0" 
     .EnablePhaseCenterCalculation "False" 
     .SetPhaseCenterAngularLimit "3.000000e+01" 
     .SetPhaseCenterComponent "boresight" 
     .SetPhaseCenterPlane "both" 
     .ShowPhaseCenter "True" 
     .ClearCuts 

     .StoreSettings
End With

'@ delete port: port2

'[VERSION]2024.0|33.0.1|20230901[/VERSION]
Port.Delete "2"

'@ clear picks

'[VERSION]2024.0|33.0.1|20230901[/VERSION]
Pick.ClearAllPicks

'@ pick face

'[VERSION]2024.0|33.0.1|20230901[/VERSION]
Pick.PickFaceFromId "antenna:waveguide", "309"

'@ define port: 1

'[VERSION]2024.0|33.0.1|20230901[/VERSION]
With Port 
     .Reset 
     .PortNumber "1" 
     .Label ""
     .Folder ""
     .NumberOfModes "1"
     .AdjustPolarization "False"
     .PolarizationAngle "0.0"
     .ReferencePlaneDistance "0"
     .TextSize "50"
     .TextMaxLimit "0"
     .Coordinates "Picks"
     .Orientation "positive"
     .PortOnBound "False"
     .ClipPickedPortToBound "False"
     .Xrange "-2.4712384308323", "2.4712384308323"
     .Yrange "-218.23446188741", "-218.23446188741"
     .Zrange "-4.9428188328245", "4.9428188328245"
     .XrangeAdd "0.0", "0.0"
     .YrangeAdd "0.0", "0.0"
     .ZrangeAdd "0.0", "0.0"
     .SingleEnded "False"
     .WaveguideMonitor "False"
     .Create 
End With

'@ farfield plot options

'[VERSION]2024.0|33.0.1|20230901[/VERSION]
With FarfieldPlot 
     .Plottype "Cartesian" 
     .Vary "angle1" 
     .Theta "90" 
     .Phi "90" 
     .Step "1" 
     .Step2 "1" 
     .SetLockSteps "True" 
     .SetPlotRangeOnly "False" 
     .SetThetaStart "0" 
     .SetThetaEnd "180" 
     .SetPhiStart "0" 
     .SetPhiEnd "360" 
     .SetTheta360 "True" 
     .SymmetricRange "True" 
     .SetTimeDomainFF "False" 
     .SetFrequency "24" 
     .SetTime "0" 
     .SetColorByValue "True" 
     .DrawStepLines "False" 
     .DrawIsoLongitudeLatitudeLines "False" 
     .ShowStructure "True" 
     .ShowStructureProfile "True" 
     .SetStructureTransparent "False" 
     .SetFarfieldTransparent "False" 
     .AspectRatio "Free" 
     .ShowGridlines "True" 
     .InvertAxes "False", "False" 
     .SetSpecials "enablepolarextralines" 
     .SetPlotMode "Gain" 
     .Distance "1" 
     .UseFarfieldApproximation "True" 
     .IncludeUnitCellSidewalls "True" 
     .SetScaleLinear "False" 
     .SetLogRange "40" 
     .SetLogNorm "0" 
     .DBUnit "0" 
     .SetMaxReferenceMode "abs" 
     .EnableFixPlotMaximum "False" 
     .SetFixPlotMaximumValue "1.0" 
     .SetInverseAxialRatio "False" 
     .SetAxesType "user" 
     .SetAntennaType "isotropic" 
     .Phistart "1.000000e+00", "0.000000e+00", "0.000000e+00" 
     .Thetastart "0.000000e+00", "0.000000e+00", "1.000000e+00" 
     .PolarizationVector "0.000000e+00", "1.000000e+00", "0.000000e+00" 
     .SetCoordinateSystemType "ludwig3" 
     .SetAutomaticCoordinateSystem "False" 
     .SetPolarizationType "Abs" 
     .SlantAngle 4.500000e+01 
     .Origin "bbox" 
     .Userorigin "0.000000e+00", "0.000000e+00", "0.000000e+00" 
     .SetUserDecouplingPlane "False" 
     .UseDecouplingPlane "False" 
     .DecouplingPlaneAxis "X" 
     .DecouplingPlanePosition "0.000000e+00" 
     .LossyGround "False" 
     .GroundEpsilon "1" 
     .GroundKappa "0" 
     .EnablePhaseCenterCalculation "False" 
     .SetPhaseCenterAngularLimit "3.000000e+01" 
     .SetPhaseCenterComponent "boresight" 
     .SetPhaseCenterPlane "both" 
     .ShowPhaseCenter "True" 
     .ClearCuts 

     .StoreSettings
End With

'@ define monitor: e-field (f=24;x=2.4801255490365)

'[VERSION]2024.0|33.0.1|20230901[/VERSION]
With Monitor 
     .Reset 
     .Name "e-field (f=24;x=2.4801255490365)" 
     .Dimension "Volume" 
     .Domain "Frequency" 
     .FieldType "Efield" 
     .MonitorValue "24" 
     .UseSubvolume "True" 
     .Coordinates "Free" 
     .SetSubvolume "-2.4712384308323", "2.4712384308323", "-218.23446188741", "218.72477233887", "-4.9428188328245", "4.9428188328245" 
     .SetSubvolumeOffset "0.0", "0.0", "0.0", "0.0", "0.0", "0.0" 
     .SetSubvolumeInflateWithOffset "False" 
     .PlaneNormal "x" 
     .PlanePosition "2.4801255490365" 
     .Create 
End With

'@ define monitor: h-field (f=24;x=2.4801255490365)

'[VERSION]2024.0|33.0.1|20230901[/VERSION]
With Monitor 
     .Reset 
     .Name "h-field (f=24;x=2.4801255490365)" 
     .Dimension "Volume" 
     .Domain "Frequency" 
     .FieldType "Hfield" 
     .MonitorValue "24" 
     .UseSubvolume "True" 
     .Coordinates "Free" 
     .SetSubvolume "-2.471238430832329", "2.471238430832329", "-218.23446188740621", "218.72477233886883", "-4.9428188328245168", "4.9428188328245168" 
     .SetSubvolumeOffset "0.0", "0.0", "0.0", "0.0", "0.0", "0.0" 
     .SetSubvolumeInflateWithOffset "False" 
     .PlaneNormal "x" 
     .PlanePosition "2.4801255490365" 
     .Create 
End With

