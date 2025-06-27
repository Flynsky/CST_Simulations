<?xml version="1.0" encoding="UTF-8"?>
<MetaResultFile version="20211011" creator="Solver HFTD - Field 3DFD Monitor">
  <MetaGeometryFile filename="model.gex" lod="1"/>
  <SimulationProperties fieldname="e-field (f=24;z=4.9605942990365) [1]" frequency="24" encoded_unit="&amp;U:V^1.:m^-1" quantity="e-field" fieldtype="E-Field" fieldscaling="PEAK" dB_Amplitude="20"/>
  <ResultDataType vector="1" complex="1" timedomain="0" frequencymap="0"/>
  <SimulationDomain min="-5.59407663 -221.3573 -8.06565666" max="5.59407663 221.84761 8.06565666"/>
  <PlotSettings Plot="4" ignore_symmetry="0" deformation="0" enforce_culling="0" integer_values="0" combine="CombineNone" default_arrow_type="ARROWS" default_scaling="NONE"/>
  <Source type="SOLVER"/>
  <SpecialMaterials>
    <Background type="NORMAL"/>
    <Material name="Silver" type="FIELDFREE"/>
  </SpecialMaterials>
  <AuxGeometryFile/>
  <AuxResultFile filename="e-field (f=24;z=4.9605942990365)_1,1^res.axg" add_to_tree="0" default="0"/>
  <FieldFreeNodes/>
  <SurfaceFieldCoefficients/>
  <UnitCell/>
  <SubVolume min_pos="-2.47123837 -218.234467 4.96059418" max_pos="2.47123837 218.724777 4.96059418" min_index="277064" max_index="335255" is_cropped="0" create_subvolume_map="1" sub_folder=""/>
  <Units/>
  <ProjectUnits>
    <Quantity name="temperature" unit="&amp;U:K^1"/>
    <Quantity name="time" unit="&amp;Un:s^1"/>
    <Quantity name="frequency" unit="&amp;UG:Hz^1"/>
    <Quantity name="length" unit="&amp;Um:m^1"/>
  </ProjectUnits>
  <TimeSampling/>
  <LocalAxes/>
  <MeshViewSettings/>
  <ResultGroups num_steps="1" transformation="1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1" process_mesh_group="0">
    <SharedDataWith>
      <Result treepath="" rexname=""/>
    </SharedDataWith>
    <Frame index="0">
      <PortModeInfoFile/>
      <FieldResultFile filename="e-field (f=24;z=4.9605942990365)_1,1.m3d" type="m3d"/>
    </Frame>
  </ResultGroups>
  <AutoScale>
    <SmartScaling log_strength="1" log_anchor="0" log_anchor_type="0" db_range="40" phase="0"/>
  </AutoScale>
</MetaResultFile>
