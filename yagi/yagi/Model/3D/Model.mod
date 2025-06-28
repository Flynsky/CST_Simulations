'# MWS Version: Version 2024.5 - Jun 14 2024 - ACIS 33.0.1 -

'# length = mm
'# frequency = GHz
'# time = ns
'# frequency range: fmin = frequency_minimum fmax = frequency_maximum


'@ use template: Antenna (Wire)

'[VERSION]2009.5|18.0.3|20090230[/VERSION]
' Template for Antenna With Ground Plane
' ======================================
' (CSTxMWSxONLY)
' draw the bounding box
Plot.DrawBox True
' set units to mm, ghz
With Units 
     .Geometry "mm"
     .Frequency "GHz"
     .Time "ns" 
End With 
' set background material to vacuum
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
' set boundary conditions to open, zmin to electric
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
Mesh.RatioLimit "20" 
Mesh.AutomeshRefineAtPecLines "True", "10"

'@ new component: Antenna

'[VERSION]2009.5|18.0.3|20090230[/VERSION]
Component.New "Antenna"

'@ activate local coordinates

'[VERSION]2012.0|22.0.0|20111125[/VERSION]
WCS.ActivateWCS "local"

'@ move wcs

'[VERSION]2012.0|22.0.0|20111125[/VERSION]
WCS.MoveWCS "local", "0.0", "0.0", "-spacing_reflector"

'@ define curve line: curve1:line1

'[VERSION]2012.0|22.0.0|20111125[/VERSION]
With Line
     .Reset 
     .Name "line1" 
     .Curve "curve1" 
     .X1 "-l_reflector/2" 
     .Y1 "0" 
     .X2 "l_reflector/2" 
     .Y2 "0" 
     .Create
End With

'@ define curvewire: curve1:reflector

'[VERSION]2012.0|22.0.0|20111125[/VERSION]
With Wire
     .Reset 
     .Name "reflector" 
     .Folder "curve1" 
     .Radius "wire_diameter/2" 
     .Type "CurveWire" 
     .Curve "curve1:line1" 
     .Material "PEC" 
     .SolidWireModel "False" 
     .Termination "Natural" 
     .Mitering "Natural" 
     .AdvancedChainSelection "True" 
     .Add
End With

'@ activate global coordinates

'[VERSION]2012.0|22.0.0|20111125[/VERSION]
WCS.ActivateWCS "global"

'@ define curve line: curve1:line2

'[VERSION]2012.0|22.0.0|20111125[/VERSION]
With Line
     .Reset 
     .Name "line2" 
     .Curve "curve1" 
     .X1 "feed_gap/2" 
     .Y1 "0" 
     .X2 "l_driver/2" 
     .Y2 "0" 
     .Create
End With

'@ define curvewire: curve1:Driven_element_1

'[VERSION]2012.0|22.0.0|20111125[/VERSION]
With Wire
     .Reset 
     .Name "Driven_element_1" 
     .Folder "feed" 
     .Radius "wire_diameter/2" 
     .Type "CurveWire" 
     .Curve "curve1:line2" 
     .Material "PEC" 
     .SolidWireModel "False" 
     .Termination "Natural" 
     .Mitering "Natural" 
     .AdvancedChainSelection "True" 
     .Add
End With

'@ transform wire: mirror feed

'[VERSION]2012.0|22.0.0|20111125[/VERSION]
With Transform 
     .Reset 
     .Name "feed" 
     .Origin "Free" 
     .Center "0", "0", "0" 
     .PlaneNormal "1", "0", "0" 
     .MultipleObjects "True" 
     .GroupObjects "False" 
     .Repetitions "1" 
     .MultipleSelection "False" 
     .Material "" 
     .Transform "Wire", "Mirror" 
End With

'@ execute macro: Make_Yagi_directors

'[VERSION]2009.5|18.0.3|20090230[/VERSION]
	Dim L_directors(40) As Variant, S_directors(40) As Variant
	Dim N_d As Integer, cnt1 As Integer, cnt2 As Integer
	Dim position_director As Double
	Dim L_d_string As String, S_d_string As String, part_name As String
	Dim D_w As Double, xxx As Double
	'Import variables
	D_w = restoredoubleparameter("wire_diameter")
	N_d = restoredoubleparameter("num_elements") - 2
	For cnt1 = 1 To N_d STEP 1
 		L_d_string = "l_director_" + CStr(cnt1)
 		S_d_string = "spacing_director_" + CStr(cnt1)
		L_directors(cnt1) = restoredoubleparameter(L_d_string)
		S_directors(cnt1) = restoredoubleparameter(S_d_string)
	Next
	'  activate local coordinates
	WCS.ActivateWCS "local"
	'Make cylindrical director elements
	position_director = 0
	For cnt2 = 1 To N_d STEP 1
		position_director = position_director + S_directors(cnt2)
		part_name = "Director_" + CStr(cnt2)
		WCS.SetOrigin ("0.00", "0.00", position_director)
			'  define curve line: curve1:line1
			With Line
			     .Reset
			     .Name "line1"
			     .Curve "curve1"
			     .X1 -L_directors(cnt2)/2
			     .Y1 "0"
			     .X2 L_directors(cnt2)/2
			     .Y2 "0"
			     .Create
			End With
			'  define curvewire: curve1:wire1
			With Wire
			     .Reset
			     .Name part_name
			     .Folder "curve1"
			     .Radius "wire_diameter/2"
			     .Type "CurveWire"
			     .Curve "curve1:line1"
			     .Material "PEC"
			     .SolidWireModel "False"
			     .Termination "Natural"
			     .Mitering "Natural"
			     .AdvancedChainSelection "True"
			     .Add
			End With
'				With Cylinder
'		     .Reset
'		     .Name part_name
'		     .Component "Antenna"
'		     .Material "PEC"
'		     .OuterRadius wire_diameter/2
'		     .InnerRadius "0"
'		     .Axis "x"
'		     .Xrange -L_directors(cnt2)/2, L_directors(cnt2)/2
'		     .Ycenter "0"
'		     .Zcenter position_director
'		     .Segments "0"
'		     .Create
'		End With
	Next

'@ define frequency range

'[VERSION]2009.5|18.0.3|20090230[/VERSION]
Solver.FrequencyRange "frequency_minimum", "frequency_maximum"

'@ pick end point

'[VERSION]2012.0|22.0.0|20111125[/VERSION]
Pick.PickWireEndpointFromId "feed:Driven_element_1_1", "0"

'@ pick end point

'[VERSION]2012.0|22.0.0|20111125[/VERSION]
Pick.PickWireEndpointFromId "feed:Driven_element_1", "0"

'@ define discrete port: 1

'[VERSION]2012.0|22.0.0|20111125[/VERSION]
With DiscretePort 
     .Reset 
     .PortNumber "1" 
     .Type "SParameter" 
     .Label "" 
     .Impedance "50.0" 
     .Voltage "1.0" 
     .Current "1.0" 
     .SetP1 "True", "-0.117418725", "0", "-17.748" 
     .SetP2 "True", "0.117418725", "0", "-17.748" 
     .InvertDirection "False" 
     .LocalCoordinates "True" 
     .Monitor "False" 
     .Radius "wire_diameter/2" 
     .Create 
End With

'@ define farfield monitor: farfield (f=frequency_centre)

'[VERSION]2009.5|18.0.3|20090230[/VERSION]
With Monitor 
     .Reset 
     .Name "farfield (f=frequency_centre)" 
     .Domain "Frequency" 
     .FieldType "Farfield" 
	    .Frequency "frequency_centre" 
     .Create 
End With

'@ define solver parameters

'[VERSION]2009.5|18.0.3|20090230[/VERSION]
Mesh.SetCreator "High Frequency" 
With Solver 
     .CalculationType "TD-S" 
     .StimulationPort "All" 
     .StimulationMode "All" 
     .SteadyStateLimit "-40" 
     .MeshAdaption "False" 
     .AutoNormImpedance "False" 
     .NormingImpedance "50" 
     .CalculateModesOnly "False" 
     .SParaSymmetry "False" 
     .StoreTDResultsInCache "False" 
     .FullDeembedding "False" 
     .UseDistributedComputing "False" 
     .DistributeMatrixCalculation "False" 
     .MPIParallelization "False" 
     .SuperimposePLWExcitation "False" 
End With

'@ set mesh properties

'[VERSION]2009.5|18.0.3|20090230[/VERSION]
With Mesh 
     .UseRatioLimit "True" 
     .RatioLimit "50" 
     .LinesPerWavelength "15" 
     .MinimumStepNumber "5" 
     .Automesh "True" 
     .MeshType "PBA" 
     .SetCreator "High Frequency" 
End With

'@ define automesh parameters

'[VERSION]2009.5|18.0.3|20090230[/VERSION]
With Mesh 
     .AutomeshStraightLines "True" 
     .AutomeshEllipticalLines "True" 
     .AutomeshRefineAtPecLines "True", "10" 
     .AutomeshRefinePecAlongAxesOnly "False" 
     .AutomeshAtEllipseBounds "True", "30" 
     .AutomeshAtWireEndPoints "True" 
     .AutomeshAtProbePoints "True" 
     .SetAutomeshRefineDielectricsType "Generalized" 
     .MergeThinPECLayerFixpoints "False" 
     .EquilibrateMesh "True" 
     .EquilibrateMeshRatio "1.19" 
     .UseCellAspectRatio "False" 
     .CellAspectRatio "50.0" 
     .UsePecEdgeModel "True" 
     .MeshType "PBA" 
     .AutoMeshLimitShapeFaces "True" 
     .AutoMeshNumberOfShapeFaces "1000" 
     .PointAccEnhancement "0" 
     .SurfaceOptimization "True" 
     .SurfaceSmoothing "3" 
     .MinimumCurvatureRefinement "100" 
     .CurvatureRefinementFactor "0.05" 
     .AnisotropicCurvatureRefinement "False" 
     .SmallFeatureSize "0.0" 
     .SurfaceTolerance "0.0" 
     .SurfaceToleranceType "Relative" 
     .NormalTolerance "22.5" 
     .AnisotropicCurvatureRefinementFSM "False" 
     .SurfaceMeshEnrichment "0" 
     .DensityTransitionsFSM "0.5" 
     .VolumeOptimization "True" 
     .VolumeSmoothing "True" 
     .VolumeMeshMethod "Delaunay" 
     .SurfaceMeshMethod "General" 
     .SurfaceMeshGeometryAccuracy "1.0e-6" 
     .DelaunayOptimizationLevel "2" 
     .DelaunayPropagationFactor "1.050000" 
     .DensityTransitions "0.5" 
     .MeshAllRegions "False" 
     .ConvertGeometryDataAfterMeshing "True" 
     .AutomeshFixpointsForBackground "True" 
     .PBAType "Fast PBA" 
     .AutomaticPBAType "True" 
     .FPBAAvoidNonRegUnite "True" 
     .DetectSmallSolidPEC "False" 
     .ConsiderSpaceForLowerMeshLimit "False" 
     .RatioLimitGovernsLocalRefinement "False" 
     .GapDetection "False" 
     .FPBAGapTolerance "1e-3" 
     .MaxParallelThreads "8"
     .SetParallelMode "Maximum"
End With 
With Solver 
     .UseSplitComponents "True" 
     .PBAFillLimit "99" 
     .EnableSubgridding "False" 
     .AlwaysExcludePec "False" 
End With

'@ switch working plane

'[VERSION]2012.0|22.0.0|20111125[/VERSION]
Plot.DrawWorkplane "false"

'@ set mesh properties

'[VERSION]2012.0|22.0.0|20111125[/VERSION]
With Mesh 
     .MeshType "Tetrahedral" 
     .SetCreator "High Frequency"
End With 
With MeshSettings 
     .SetMeshType "Tet" 
     .Set "Version", 1%
     .Set "StepsPerWaveNear", "4" 
     .Set "StepsPerBoxNear", "10" 
     .Set "MaxStepNear", "0" 
     .Set "ModelBoxDescrNear", "maxedge" 
     .Set "StepsPerWaveFar", "4" 
     .Set "StepsPerBoxFar", "10" 
     .Set "MaxStepFar", "0" 
     .Set "ModelBoxDescrFar", "maxedge" 
     .Set "UseMaxStepAbsolute", "0" 
     .Set "UseSameNearToAndFarFrom", "1" 
End With 
With MeshSettings 
     .SetMeshType "Tet" 
     .Set "UseRatioLimit", "0" 
     .Set "RatioLimit", "100" 
     .Set "MinStep", "0" 
End With 
With MeshSettings 
     .SetMeshType "Tet" 
     .Set "CurvatureOrder", "2" 
     .Set "CurvRefinementControl", "NormalTolerance" 
     .Set "NormalTolerance", "60" 
     .Set "SrfMeshGradation", "2" 
     .Set "SrfMeshOptimization", "1" 
End With 
With MeshSettings 
     .SetMeshType "Unstr" 
     .Set "UseMaterials",  "1" 
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
     .Set "CoincidenceTolerance", "1e-006" 
     .Set "SelfIntersectionCheck", "1" 
End With 
With MeshSettings 
     .SetMeshType "Unstr" 
     .Set "UseDC", "0" 
End With

'@ define pml specials

'[VERSION]2012.0|22.0.0|20111125[/VERSION]
With Boundary
     .DefinitionType "Default" 
     .Layer "4" 
     .AbsoluteDepth "0" 
     .FractionPMLDepth "0" 
     .BaseFrequencyPMLDepth "0" 
     .MinimumDistanceType "Fraction" 
     .MinimumDistancePerWavelength "4" 
     .MinimumDistanceReferenceFrequencyType "Center" 
     .FrequencyForMinimumDistance "3" 
End With

'@ define frequency domain solver parameters

'[VERSION]2012.0|22.0.0|20111125[/VERSION]
Mesh.SetCreator "High Frequency" 
With FDSolver
     .Reset 
     .Method "Tetrahedral Mesh" 
     .OrderTet "Second" 
     .OrderHFMOR "1" 
     .OrderSrf "First" 
     .Stimulation "All", "1" 
     .ResetExcitationList 
     .AutoNormImpedance "False" 
     .NormingImpedance "50" 
     .ModesOnly "False" 
     .ConsiderPortLossesTet "True" 
     .SetShieldAllPorts "False" 
     .AccuracyHex "1e-6" 
     .AccuracyTet "1e-4" 
     .AccuracySrf "1e-3" 
     .LimitIterations "False" 
     .MaxIterations "0" 
     .SetCalculateExcitationsInParallel "True", "False", "" 
     .StoreAllResults "False" 
     .StoreResultsInCache "False" 
     .UseHelmholtzEquation "True" 
     .LowFrequencyStabilization "True" 
     .Type "Auto" 
     .MeshAdaptionHex "False" 
     .MeshAdaptionTet "True" 
     .AcceleratedRestart "True" 
     .FreqDistAdaptMode "Distributed" 
     .HexMORSettings "", "1001" 
     .NewIterativeSolver "True" 
     .TDCompatibleMaterials "False" 
     .ExtrudeOpenBC "True" 
     .SetOpenBCTypeHex "Default" 
     .SetOpenBCTypeTet "Default" 
     .AddMonitorSamples "True" 
     .SParameterSweep "True" 
     .CalcStatBField "False" 
     .UseDoublePrecision "False" 
     .UseDoublePrecision_ML "True" 
     .MixedOrderSrf "False" 
     .MixedOrderTet "False" 
     .PreconditionerAccuracyIntEq "0.15" 
     .MLFMMAccuracy "Default" 
     .MinMLFMMBoxSize "0.20" 
     .UseCFIEForCPECIntEq "true" 
     .UseFastRCSSweepIntEq "true" 
     .UseSensitivityAnalysis "False" 
     .SweepErrorThreshold "True", "0.01" 
     .SweepErrorChecks "2" 
     .SweepMinimumSamples "3" 
     .SweepConsiderAll "True" 
     .SweepConsiderReset 
     .InterpolationSamples "1001" 
     .SweepWeightEvanescent "1.0" 
     .AddSampleInterval "", "", "1", "Automatic", "True" 
     .AddSampleInterval "", "", "", "Automatic", "False" 
     .MPIParallelization "False"
     .UseDistributedComputing "True"
     .NetworkComputingStrategy "Samples"
     .NetworkComputingJobCount "3"
     .LimitCPUs "True"
     .MaxCPUs "48"
End With
UseDistributedComputingForParameters "True" 
MaxNumberOfDistributedComputingParameters "2" 
UseDistributedComputingMemorySetting "False" 
MinDistributedComputingMemoryLimit "0" 
With IESolver
     .Reset 
     .UseFastFrequencySweep "True" 
     .UseIEGroundPlane "False" 
     .PreconditionerType "Auto" 
End With
With IESolver
     .SetFMMFFCalcStopLevel "0" 
     .SetFMMFFCalcNumInterpPoints "6" 
     .UseFMMFarfieldCalc "True" 
     .SetCFIEAlpha "0.500000" 
     .LowFrequencyStabilization "False" 
     .LowFrequencyStabilizationML "True" 
     .Multilayer "False" 
     .SetiMoMACC_I "0.0001" 
     .SetiMoMACC_M "0.0001" 
     .DeembedExternalPorts "True" 
     .SetOpenBC_XY "True" 
     .OldRCSSweepDefintion "False" 
End With

'@ set mesh properties

'[VERSION]2012.0|22.0.0|20111125[/VERSION]
With Mesh 
     .MeshType "Surface" 
     .SetCreator "High Frequency"
End With 
With MeshSettings 
     .SetMeshType "Srf" 
     .Set "Version", 1%
     .Set "StepsPerWaveNear", "3" 
     .Set "StepsPerBoxNear", "4" 
     .Set "MaxStepNear", "0" 
     .Set "ModelBoxDescrNear", "maxedge" 
     .Set "StepsPerWaveFar", "3" 
     .Set "StepsPerBoxFar", "4" 
     .Set "MaxStepFar", "0" 
     .Set "ModelBoxDescrFar", "maxedge" 
     .Set "UseMaxStepAbsolute", "0" 
     .Set "UseSameNearToAndFarFrom", "1" 
End With 
With MeshSettings 
     .SetMeshType "Srf" 
     .Set "UseRatioLimit", "0" 
     .Set "RatioLimit", "100" 
     .Set "MinStep", "0" 
End With 
With MeshSettings 
     .SetMeshType "Srf" 
     .Set "CurvatureOrder", "1" 
     .Set "CurvRefinementControl", "NormalTolerance" 
     .Set "NormalTolerance", "60" 
     .Set "SrfMeshGradation", "2" 
     .Set "SrfMeshOptimization", "1" 
End With 
With MeshSettings 
     .SetMeshType "Unstr" 
     .Set "UseMaterials",  "1" 
End With 
With MeshSettings 
     .SetMeshType "Srf" 
     .Set "UseAnisoCurveRefinement", "1" 
End With 
With MeshSettings 
     .SetMeshType "Unstr" 
     .Set "SmallFeatureSize", "0" 
     .Set "CoincidenceTolerance", "1e-006" 
     .Set "SelfIntersectionCheck", "1" 
End With 
With MeshSettings 
     .SetMeshType "Unstr" 
     .Set "UseDC", "0" 
End With

'@ define frequency domain solver parameters

'[VERSION]2012.0|22.0.0|20111125[/VERSION]
Mesh.SetCreator "High Frequency" 
With FDSolver
     .Reset 
     .Method "Surface Mesh" 
     .OrderTet "Second" 
     .OrderHFMOR "1" 
     .OrderSrf "Second" 
     .Stimulation "All", "1" 
     .ResetExcitationList 
     .AutoNormImpedance "False" 
     .NormingImpedance "50" 
     .ModesOnly "False" 
     .ConsiderPortLossesTet "True" 
     .SetShieldAllPorts "False" 
     .AccuracyHex "1e-6" 
     .AccuracyTet "1e-4" 
     .AccuracySrf "1e-3" 
     .LimitIterations "False" 
     .MaxIterations "0" 
     .SetCalculateExcitationsInParallel "True", "False", "" 
     .StoreAllResults "False" 
     .StoreResultsInCache "False" 
     .UseHelmholtzEquation "True" 
     .LowFrequencyStabilization "True" 
     .Type "Auto" 
     .MeshAdaptionHex "False" 
     .MeshAdaptionTet "True" 
     .AcceleratedRestart "True" 
     .FreqDistAdaptMode "Distributed" 
     .HexMORSettings "", "1001" 
     .NewIterativeSolver "True" 
     .TDCompatibleMaterials "False" 
     .ExtrudeOpenBC "True" 
     .SetOpenBCTypeHex "Default" 
     .SetOpenBCTypeTet "Default" 
     .AddMonitorSamples "True" 
     .SParameterSweep "True" 
     .CalcStatBField "False" 
     .UseDoublePrecision "True" 
     .UseDoublePrecision_ML "True" 
     .MixedOrderSrf "False" 
     .MixedOrderTet "False" 
     .PreconditionerAccuracyIntEq "0.15" 
     .MLFMMAccuracy "Default" 
     .MinMLFMMBoxSize "0.20" 
     .UseCFIEForCPECIntEq "true" 
     .UseFastRCSSweepIntEq "true" 
     .UseSensitivityAnalysis "False" 
     .SweepErrorThreshold "True", "0.01" 
     .SweepErrorChecks "2" 
     .SweepMinimumSamples "3" 
     .SweepConsiderAll "True" 
     .SweepConsiderReset 
     .InterpolationSamples "1001" 
     .SweepWeightEvanescent "1.0" 
     .AddSampleInterval "", "", "", "Automatic", "False" 
     .MPIParallelization "False"
     .UseDistributedComputing "False"
     .NetworkComputingStrategy "Samples"
     .NetworkComputingJobCount "3"
     .LimitCPUs "True"
     .MaxCPUs "48"
End With
With IESolver
     .Reset 
     .UseFastFrequencySweep "True" 
     .UseIEGroundPlane "False" 
     .PreconditionerType "Auto" 
End With
With IESolver
     .SetFMMFFCalcStopLevel "0" 
     .SetFMMFFCalcNumInterpPoints "6" 
     .UseFMMFarfieldCalc "True" 
     .SetCFIEAlpha "0.500000" 
     .LowFrequencyStabilization "False" 
     .LowFrequencyStabilizationML "True" 
     .Multilayer "False" 
     .SetiMoMACC_I "0.0001" 
     .SetiMoMACC_M "0.0001" 
     .DeembedExternalPorts "True" 
     .SetOpenBC_XY "True" 
     .OldRCSSweepDefintion "False" 
End With

'@ farfield plot options

'[VERSION]2012.0|22.0.0|20120106[/VERSION]
With FarfieldPlot 
     .Plottype "Polar" 
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
     .SetTheta360 "False" 
     .SymmetricRange "False" 
     .SetTimeDomainFF "False" 
     .SetFrequency "3" 
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
     .EnablePhaseCenterCalculation "False" 
     .SetPhaseCenterAngularLimit "3.000000e+001" 
     .SetPhaseCenterComponent "boresight" 
     .SetPhaseCenterPlane "both" 
     .ShowPhaseCenter "True" 
     .StoreSettings
End With

'@ activate global coordinates

'[VERSION]2012.0|22.0.0|20120106[/VERSION]
WCS.ActivateWCS "global"

'@ set units in materials

'[VERSION]2014.6|23.0.0|20141128[/VERSION]
Material.SetUnitInMaterial "$CoilMaterial$", "GHz", "mm"

'@ set mesh properties (for backward compatibility)

'[VERSION]2014.6|23.0.0|20141128[/VERSION]
With MeshSettings
     .SetMeshType "Hex"
     .Set "Version", 0%
End With
With MeshSettings 
     .SetMeshType "Tet" 
     .Set "CellsPerWavelengthPolicy", "cellsperwavelength" 
     .Set "CurvatureOrderPolicy", "fixedorder" 
     .SetMeshType "Plane" 
     .Set "CurvatureOrderPolicy", "off" 
End With 
With MeshSettings 
     .SetMeshType "Tet" 
     .Set "WavelengthRefinementSameAsNear", "1" 
     .Set "GeometryRefinementSameAsNear", "1" 
     .SetMeshType "Srf" 
     .Set "WavelengthRefinementSameAsNear", "1" 
     .Set "GeometryRefinementSameAsNear", "1" 
End With 
With MeshSettings 
    .SetMeshType "Tet"
    .Set "UseSurfaceMesh3DGradation", False
    .SetMeshType "Srf"
    .Set "UseSurfaceMesh3DGradation", False
End With

'@ change solver and mesh type

'[VERSION]2014.6|23.0.0|20141128[/VERSION]
ChangeSolverAndMeshType "HF IntegralEq"

'@ define frequency domain solver parameters

'[VERSION]2014.6|23.0.0|20141128[/VERSION]
Mesh.SetCreator "High Frequency" 
With FDSolver
     .Reset 
     .SetMethod "Surface", "General purpose" 
     .OrderTet "Second" 
     .OrderSrf "Second" 
     .Stimulation "All", "1" 
     .ResetExcitationList 
     .AutoNormImpedance "False" 
     .NormingImpedance "50" 
     .ModesOnly "False" 
     .ConsiderPortLossesTet "True" 
     .SetShieldAllPorts "False" 
     .AccuracyHex "1e-6" 
     .AccuracyTet "1e-4" 
     .AccuracySrf "1e-3" 
     .LimitIterations "False" 
     .MaxIterations "0" 
     .SetCalculateExcitationsInParallel "True", "False", "" 
     .StoreAllResults "False" 
     .StoreResultsInCache "False" 
     .UseHelmholtzEquation "True" 
     .LowFrequencyStabilization "True" 
     .Type "Auto" 
     .MeshAdaptionHex "False" 
     .MeshAdaptionTet "True" 
     .AcceleratedRestart "True" 
     .FreqDistAdaptMode "Distributed" 
     .NewIterativeSolver "True" 
     .TDCompatibleMaterials "False" 
     .ExtrudeOpenBC "True" 
     .SetOpenBCTypeHex "Default" 
     .SetOpenBCTypeTet "Default" 
     .AddMonitorSamples "True" 
     .CalcStatBField "False" 
     .CalcPowerLoss "True" 
     .CalcPowerLossPerComponent "False" 
     .StoreSolutionCoefficients "True" 
     .UseDoublePrecision "True" 
     .UseDoublePrecision_ML "True" 
     .MixedOrderSrf "False" 
     .MixedOrderTet "False" 
     .PreconditionerAccuracyIntEq "0.15" 
     .MLFMMAccuracy "Default" 
     .MinMLFMMBoxSize "0.20" 
     .UseCFIEForCPECIntEq "true" 
     .UseFastRCSSweepIntEq "true" 
     .UseSensitivityAnalysis "False" 
     .SweepErrorThreshold "True", "0.01" 
     .SweepErrorChecks "2" 
     .SweepMinimumSamples "3" 
     .SweepConsiderAll "True" 
     .SweepConsiderReset 
     .SetNumberOfResultDataSamples "1001" 
     .SweepWeightEvanescent "1.0" 
     .AccuracyROM "1e-4" 
     .AddSampleInterval "", "", "", "Automatic", "False" 
     .MPIParallelization "False"
     .UseDistributedComputing "False"
     .NetworkComputingStrategy "Samples"
     .NetworkComputingJobCount "3"
     .LimitCPUs "True"
     .MaxCPUs "48"
     .HardwareAcceleration "False"
     .MaximumNumberOfGPUs "1"
End With
With IESolver
     .Reset 
     .UseFastFrequencySweep "True" 
     .UseIEGroundPlane "False" 
     .PreconditionerType "Auto" 
End With
With IESolver
     .SetFMMFFCalcStopLevel "0" 
     .SetFMMFFCalcNumInterpPoints "6" 
     .UseFMMFarfieldCalc "True" 
     .SetCFIEAlpha "0.500000" 
     .LowFrequencyStabilization "False" 
     .LowFrequencyStabilizationML "True" 
     .Multilayer "False" 
     .SetiMoMACC_I "0.0001" 
     .SetiMoMACC_M "0.0001" 
     .DeembedExternalPorts "True" 
     .SetOpenBC_XY "True" 
     .OldRCSSweepDefintion "False" 
     .SetAccuracySetting "Custom" 
End With

'@ execute macro: Parametric FarField Request

'[VERSION]2012.0|22.0.0|20120106[/VERSION]
Dim cst_fflow As Double
Dim cst_ffhigh As Double
Dim cst_ffstep As Double
Dim fmin As Double
Dim fmax As Double
Dim nnn As Integer
Dim nff As Integer
MakeSureParameterExists("num_ff_monitors",5)
'Import variables
fmin = restoredoubleparameter("frequency_minimum")
fmax = restoredoubleparameter("frequency_maximum")
nff = restoredoubleparameter("num_ff_monitors")
Dim cst_action As String
If nff = 1 Then
                cst_fflow = (fmin+fmax)/2
                cst_ffhigh = (fmin+fmax)/2
                cst_ffstep = 1
Else
                cst_fflow = fmin
                cst_ffhigh = fmax
                cst_ffstep = (cst_ffhigh-cst_fflow)/(nff-1)
End If
cst_action = "create"
If cst_action = "create" Then
	StoreGlobalDataValue "Macros\Broadband Farfield Monitors\frq_low" , cst_fflow
	StoreGlobalDataValue "Macros\Broadband Farfield Monitors\frq_high", cst_ffhigh
	StoreGlobalDataValue "Macros\Broadband Farfield Monitors\frq_step", cst_ffstep
	Dim cst_ffrq As Double
	Dim ctmp As String
	' safety against rounding errors for upper limit (tiny increase of cst_ffhigh)
	cst_ffhigh = cst_ffhigh + 0.000001 * cst_ffstep
                nnn = 1
	For cst_ffrq=cst_fflow To cst_ffhigh STEP cst_ffstep
		'ctmp="ff_"+Replace(Format(cst_ffrq,"00.0000"),",",".")
        'ctmp="ff_"+CStr(nnn)
        ctmp = "farfield (f="+CStr(cst_ffrq)+")"
        nnn = nnn+1
		With Monitor
		     .Reset
		     .Name ctmp
		     .FieldType "Farfield"
		     .Frequency Replace(CStr(cst_ffrq)+"+0*num_ff_monitors", ",", ".")
		     .Create
		End With
	Next cst_ffrq
	ScreenUpdating True
End If

'@ farfield plot options

'[VERSION]2014.6|23.0.0|20141128[/VERSION]
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
     .SetTheta360 "False" 
     .SymmetricRange "False" 
     .SetTimeDomainFF "False" 
     .SetFrequency "3" 
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
     .SetAntennaType "unknown" 
     .Phistart "1.000000e+000", "0.000000e+000", "0.000000e+000" 
     .Thetastart "0.000000e+000", "0.000000e+000", "1.000000e+000" 
     .PolarizationVector "0.000000e+000", "1.000000e+000", "0.000000e+000" 
     .SetCoordinateSystemType "spherical" 
     .SetAutomaticCoordinateSystem "True" 
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

'@ Exported from Antenna Magus: Yagi-Uda dipole array - Saturday, June 28, 2025

'[VERSION]2014.6|23.0.0|20090230[/VERSION]

'@ set mesh properties (for backward compatibility)

'[VERSION]2024.5|33.0.1|20240614[/VERSION]
With MeshSettings 
     .SetMeshType "Tet" 
     .Set "WavelengthRefinementSameAsNear", "1" 
     .Set "GeometryRefinementSameAsNear", "1" 
     .SetMeshType "Srf" 
     .Set "WavelengthRefinementSameAsNear", "1" 
     .Set "GeometryRefinementSameAsNear", "1" 
End With 

With MeshSettings 
    .SetMeshType "Srf"
    .Set "UseSurfaceMesh3DGradation", False
End With

'@ define frequency domain solver parameters

'[VERSION]2024.5|33.0.1|20240614[/VERSION]
Mesh.SetCreator "High Frequency" 

With FDSolver
     .Reset 
     .SetMethod "Surface", "General purpose" 
     .OrderTet "Second" 
     .OrderSrf "Second" 
     .Stimulation "All", "1" 
     .ResetExcitationList 
     .AutoNormImpedance "False" 
     .NormingImpedance "50" 
     .ModesOnly "False" 
     .ConsiderPortLossesTet "True" 
     .SetShieldAllPorts "False" 
     .AccuracyHex "1e-6" 
     .AccuracyTet "1e-4" 
     .AccuracySrf "1e-3" 
     .LimitIterations "False" 
     .MaxIterations "0" 
     .SetCalcBlockExcitationsInParallel "True", "True", "" 
     .StoreAllResults "False" 
     .StoreResultsInCache "False" 
     .UseHelmholtzEquation "True" 
     .LowFrequencyStabilization "True" 
     .Type "Auto" 
     .MeshAdaptionHex "False" 
     .MeshAdaptionTet "True" 
     .AcceleratedRestart "True" 
     .FreqDistAdaptMode "Distributed" 
     .NewIterativeSolver "True" 
     .TDCompatibleMaterials "False" 
     .ExtrudeOpenBC "True" 
     .SetOpenBCTypeHex "Default" 
     .SetOpenBCTypeTet "Default" 
     .AddMonitorSamples "True" 
     .CalcPowerLoss "True" 
     .CalcPowerLossPerComponent "False" 
     .SetKeepSolutionCoefficients "All" 
     .UseDoublePrecision "True" 
     .UseDoublePrecision_ML "True" 
     .MixedOrderSrf "False" 
     .MixedOrderTet "False" 
     .PreconditionerAccuracyIntEq "0.15" 
     .MLFMMAccuracy "Default" 
     .MinMLFMMBoxSize "0.20" 
     .UseCFIEForCPECIntEq "True" 
     .UseEnhancedCFIE2 "True" 
     .UseFastRCSSweepIntEq "true" 
     .UseSensitivityAnalysis "False" 
     .UseEnhancedNFSImprint "True" 
     .UseFastDirectFFCalc "False" 
     .RemoveAllStopCriteria "Hex"
     .AddStopCriterion "All S-Parameters", "0.01", "2", "Hex", "True"
     .AddStopCriterion "Reflection S-Parameters", "0.01", "2", "Hex", "False"
     .AddStopCriterion "Transmission S-Parameters", "0.01", "2", "Hex", "False"
     .RemoveAllStopCriteria "Tet"
     .AddStopCriterion "All S-Parameters", "0.01", "2", "Tet", "True"
     .AddStopCriterion "Reflection S-Parameters", "0.01", "2", "Tet", "False"
     .AddStopCriterion "Transmission S-Parameters", "0.01", "2", "Tet", "False"
     .AddStopCriterion "All Probes", "0.05", "2", "Tet", "True"
     .RemoveAllStopCriteria "Srf"
     .AddStopCriterion "All S-Parameters", "0.01", "2", "Srf", "True"
     .AddStopCriterion "Reflection S-Parameters", "0.01", "2", "Srf", "False"
     .AddStopCriterion "Transmission S-Parameters", "0.01", "2", "Srf", "False"
     .SweepMinimumSamples "3" 
     .SetNumberOfResultDataSamples "1001" 
     .SetResultDataSamplingMode "Automatic" 
     .SweepWeightEvanescent "1.0" 
     .AccuracyROM "1e-4" 
     .AddSampleInterval "", "", "", "Automatic", "False" 
     .MPIParallelization "False"
     .UseDistributedComputing "False"
     .NetworkComputingStrategy "Samples"
     .NetworkComputingJobCount "3"
     .UseParallelization "True"
     .MaxCPUs "48"
     .MaximumNumberOfCPUDevices "2"
     .HardwareAcceleration "False"
     .MaximumNumberOfGPUs "1"
End With

With IESolver
     .Reset 
     .UseFastFrequencySweep "True" 
     .UseIEGroundPlane "False" 
     .SetRealGroundMaterialName "" 
     .CalcFarFieldInRealGround "False" 
     .RealGroundModelType "Auto" 
     .PreconditionerType "Type 1" 
     .ExtendThinWireModelByWireNubs "False" 
     .ExtraPreconditioning "False" 
End With

With IESolver
     .SetFMMFFCalcStopLevel "0" 
     .SetFMMFFCalcNumInterpPoints "6" 
     .UseFMMFarfieldCalc "True" 
     .SetCFIEAlpha "0.500000" 
     .LowFrequencyStabilization "False" 
     .LowFrequencyStabilizationML "True" 
     .Multilayer "False" 
     .SetiMoMACC_I "0.0001" 
     .SetiMoMACC_M "0.0001" 
     .DeembedExternalPorts "True" 
     .SetOpenBC_XY "True" 
     .OldRCSSweepDefintion "False" 
     .SetRCSOptimizationProperties "True", "100", "0.00001" 
     .SetAccuracySetting "Custom" 
     .CalculateSParaforFieldsources "True" 
     .ModeTrackingCMA "True" 
     .NumberOfModesCMA "3" 
     .StartFrequencyCMA "-1.0" 
     .SetAccuracySettingCMA "Default" 
     .FrequencySamplesCMA "0" 
     .SetMemSettingCMA "Auto" 
     .CalculateModalWeightingCoefficientsCMA "True" 
     .DetectThinDielectrics "True" 
End With

'@ farfield plot options

'[VERSION]2024.5|33.0.1|20240614[/VERSION]
With FarfieldPlot 
     .Plottype "3D" 
     .Vary "angle1" 
     .Theta "90" 
     .Phi "90" 
     .Step "3" 
     .Step2 "3" 
     .SetLockSteps "True" 
     .SetPlotRangeOnly "False" 
     .SetThetaStart "0" 
     .SetThetaEnd "180" 
     .SetPhiStart "0" 
     .SetPhiEnd "360" 
     .SetTheta360 "False" 
     .SymmetricRange "False" 
     .SetTimeDomainFF "False" 
     .SetFrequency "3" 
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

'@ define monitor: e-field (f=1)

'[VERSION]2024.5|33.0.1|20240614[/VERSION]
With Monitor 
     .Reset 
     .Name "e-field (f=1)" 
     .Dimension "Volume" 
     .Domain "Frequency" 
     .FieldType "Efield" 
     .MonitorValue "1" 
     .UseSubvolume "True" 
     .Coordinates "Calculation" 
     .SetSubvolume "-148.3969761512", "148.3969761512", "-74.9481145", "74.9481145", "-119.9169832", "765.5799999946" 
     .SetSubvolumeOffset "0.0", "0.0", "0.0", "0.0", "0.0", "0.0" 
     .SetSubvolumeInflateWithOffset "False" 
     .Create 
End With

'@ define monitor: h-field (f=1)

'[VERSION]2024.5|33.0.1|20240614[/VERSION]
With Monitor 
     .Reset 
     .Name "h-field (f=1)" 
     .Dimension "Volume" 
     .Domain "Frequency" 
     .FieldType "Hfield" 
     .MonitorValue "1" 
     .UseSubvolume "True" 
     .Coordinates "Calculation" 
     .SetSubvolume "-148.3969761512", "148.3969761512", "-74.9481145", "74.9481145", "-119.9169832", "765.5799999946" 
     .SetSubvolumeOffset "0.0", "0.0", "0.0", "0.0", "0.0", "0.0" 
     .SetSubvolumeInflateWithOffset "False" 
     .Create 
End With

'@ farfield plot options

'[VERSION]2024.5|33.0.1|20240614[/VERSION]
With FarfieldPlot 
     .Plottype "3D" 
     .Vary "angle1" 
     .Theta "90" 
     .Phi "90" 
     .Step "3" 
     .Step2 "3" 
     .SetLockSteps "True" 
     .SetPlotRangeOnly "False" 
     .SetThetaStart "0" 
     .SetThetaEnd "180" 
     .SetPhiStart "0" 
     .SetPhiEnd "360" 
     .SetTheta360 "False" 
     .SymmetricRange "False" 
     .SetTimeDomainFF "False" 
     .SetFrequency "3" 
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

