within ThermoPower.ThermoPower.NH33;
model Model30125sdh040666
  annotation (Diagram(coordinateSystem(extent = {{-500.0, -500.0}, {500.0, 500.0}}, 
    grid = {2.0, 2.0}), graphics = {Text(origin = {-94.18990825688067, -150.00000000000006}, 
    lineColor = {0, 0, 0}, 
    extent = {{-14.999999999999972, 10.0}, {15.0, -10.0}}, 
    textString = "E_103", 
    fontSize = 10, 
    textStyle = {TextStyle.Bold}, 
    textColor = {0, 0, 0}, 
    horizontalAlignment = LinePattern.None), Text(origin = {416.8930275229358, 83.2508164934193}, 
    lineColor = {0, 0, 0}, 
    extent = {{-37.52403669724771, 10.0}, {37.524036697247766, -10.0}}, 
    textString = "CombAir", 
    fontSize = 10, 
    textStyle = {TextStyle.Bold}, 
    textColor = {0, 0, 0}, 
    horizontalAlignment = LinePattern.None), Text(origin = {-62.6015596330273, 138.53274846925285}, 
    lineColor = {0, 0, 0}, 
    extent = {{-15.0, 5.0}, {15.0, -5.0}}, 
    textString = "PSA", 
    fontSize = 11, 
    textStyle = {TextStyle.Bold}, 
    textColor = {0, 0, 0}, 
    horizontalAlignment = LinePattern.None), Text(origin = {-5.44185779816527, 143.53274846925285}, 
    lineColor = {0, 0, 0}, 
    extent = {{-59.3810091743119, 10.0}, {59.381009174311984, -10.0}}, 
    textString = "Pure H2 Production", 
    fontSize = 11, 
    textStyle = {TextStyle.Bold}, 
    textColor = {0, 0, 0}, 
    horizontalAlignment = LinePattern.None)}), 
    Icon(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, 
      grid = {2.0, 2.0}), graphics = {Bitmap(origin = {-21.0, 7.9999999999999964}, 
      extent = {{-159.0, -85.0}, {159.0, 85.0}}, 
      fileName = "modelica://ThermoPower/../../../picture/5b4cfc9b69d2c611490e33474e33e1ad.jpg")}), 
    experiment(Algorithm = Dassl, NumberOfIntervals = 500, StartTime = 0, StopTime = 60000, Tolerance = 0.0001));

  parameter Real Y_A = 0.5 "New mass fraction of component A";
  NH3.heatexchangerrr HX2(Dehex = 0.08, 
    Lhex = 5, 
    Dihex = 0.05, 
    Nnodes = 3, 
    redeclare package FlueGasMedium = ThermoPower.Media.AmmoniaGas, 
    redeclare package FluidMedium = ThermoPower.Media.AmmoniaGas, 
    phex = 100000, 
    whex = 2, 
    hexFVb(redeclare package Medium = ThermoPower.Media.AmmoniaGas, 
      wnom
       = 1, 
      L
       = 1, 
      pstart
       = 100000, 
      Tstartbar
       = 303.15, 
      Tstartin
       = 303.15, 
      Tstartout
       = 303.15, 
      FFtype
       = Choices.Flow1D.FFtypes.Cfnom, 
      Cfnom
       = 0.3), 
    hexFVa(redeclare package Medium = ThermoPower.Media.AmmoniaGas, pstart
       = 100000, 
      Tstartbar
       = 298.15, 
      Tstartin
       = 298.15, 
      Tstartout
       = 323.15, 
      Cfnom
       = 0.02, 
      wnm
       = 0.3), 
    gasIn1(redeclare package Medium = ThermoPower.Media.AmmoniaGas), 
    gasOut1(redeclare package Medium = ThermoPower.Media.AmmoniaGas), 
    Cfhex = 0.003, 
    SSInit = true, Tstartbar_M = 473.15, Tstartbar_G = 373.15)
    annotation (Placement(transformation(origin = {-78.0, -89.99999999999997}, 
      extent = {{-10.0, 10.0}, {10.0, -10.0}})));
  inner System system
    annotation (Placement(transformation(origin = {-244.0, 210.9}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  NH3.heatexchangerrr HX4(Dehex = 0.1, 
    Lhex = 5, 
    Dihex = 0.05, 
    Nnodes = 3, 
    redeclare package FlueGasMedium = ThermoPower.Media.AmmoniaGas, 
    redeclare package FluidMedium = ThermoPower.Media.AmmoniaGas, 
    phex = 100000, 
    whex = 2, 
    hexFVb(redeclare package Medium = Media.FlueGas, 
      wnom
       = 1, 
      L
       = 5, 
      pstart
       = 100000, 
      Tstartbar
       = 323.15, 
      Tstartin
       = 323.15, 
      Tstartout
       = 323.15, 
      Cfnom
       = 0.2, 
      FFtype
       = Choices.Flow1D.FFtypes.Cfnom), 
    hexFVa(redeclare package Medium = ThermoPower.Media.AmmoniaGas, pstart
       = 100000, 
      Tstartbar
       = 298.15, 
      Tstartin
       = 298.15, 
      Tstartout
       = 323.15, 
      Cfnom
       = 0.02, 
      Kfc
       = 0.5), 
    gasIn1(redeclare package Medium = ThermoPower.Media.FlueGas), 
    gasOut1(redeclare package Medium = ThermoPower.Media.FlueGas), 
    Cfhex = 0.02, 
    SSInit = true, Tstartbar_M = 473.15, Tstartbar_G = 373.15)
    annotation (Placement(transformation(origin = {84.73798165137626, -89.00000000000003}, 
      extent = {{-10.0, 10.0}, {10.0, -10.0}})));



  Gas.SourceMassFlow Empty(redeclare package Medium = Media.AmmoniaGas)
    annotation (Placement(transformation(origin = {420.0, -202.00000000000006}, 
      extent = {{10.0, -10.0}, {-10.0, 10.0}})));
  NH3cracking_reactor NH3_cracking(redeclare package Exhaust = ThermoPower.Media.AmmoniaGas, 
    V = 0.1, S = 0.1, 
    redeclare package Air = ThermoPower.Media.AmmoniaGas, 
    HH = 0, 
    noInitialPressure = false, 
    initOpt = Choices.Init.Options.noInit, 
    pstart = 2e5)
    annotation (Placement(transformation(origin = {386.0, -202.00000000000006}, 
      extent = {{10.0, -10.0}, {-10.0, 10.0}})));
  Modelica.Thermal.HeatTransfer.Components.HeatCapacitor heatCapacitor1(
    C = 1000000, T(start = 300, fixed = true))
    annotation (Placement(transformation(origin = {436.00000000000006, -251.99999999999994}, 
      extent = {{-10.0, 10.0}, {10.0, -10.0}}, 
      rotation = 90.0)));
  Modelica.Thermal.HeatTransfer.Components.Convection convection
    annotation (Placement(transformation(origin = {391.99999999999983, -239.99999999999994}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}}, 
      rotation = 90.0)));
  Modelica.Blocks.Sources.Constant thermalConductance(k = 1000)
    annotation (Placement(transformation(origin = {361.9999999999997, -239.99999999999991}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));



  Gas.SourceMassFlow CombAir(redeclare package Medium = ThermoPower.Media.Air, 
    w0 = 0.3, 
    T = 373.15, 
    use_in_w0 = false, 
    p0 = 9.999999999999999e5)


    annotation (Placement(transformation(origin = {382.0, 65.89999999999999}, 
      extent = {{10.0, -10.0}, {-10.0, 10.0}})));
  Combustor Combustor1(HH_H2 = 120e6, HH_NH3 = 2e+06, 
    V = 1, S = 1, initOpt = Choices.Init.Options.noInit, 
    noInitialPressure = true, 
    pstart = 2e5, Tstart = 573.15)

    annotation (Placement(transformation(origin = {340.0, 65.89999999999999}, 
      extent = {{10.0, -10.0}, {-10.0, 10.0}})));
  Modelica.Thermal.HeatTransfer.Components.HeatCapacitor heatCapacitor2(
    C = 300000, T(start = 300, fixed = true))
    annotation (Placement(transformation(origin = {389.3689908256882, 8.000000000000005}, 
      extent = {{-10.0, 10.0}, {10.0, -10.0}}, 
      rotation = 90.0)));
  Modelica.Thermal.HeatTransfer.Components.Convection convection1
    annotation (Placement(transformation(origin = {358.39302752293594, 23.440088691795953}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}}, 
      rotation = 90.0)));
  Modelica.Blocks.Sources.Constant thermalConductance1(k = 600)
    annotation (Placement(transformation(origin = {315.44110091743136, 23.440088691796}, 
      extent = {{-7.000000000000014, -7.000000000000011}, {7.000000000000014, 7.000000000000011}})));
  NH3.mySeparator PSA(
    HH = 0, 
    pstart = 1e5, 
    V = 0.1, 
    S = 0.1, 
    SepX = {0, 1, 0.5}, 
    Tmstart = 303.15, 
    noInitialPressure = false) annotation (Placement(transformation(origin = {-67.6015596330273, 171.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  NH3.heatexchangerrr HX5(Dehex = 0.1, 
    Lhex = 5, 
    Dihex = 0.05, 
    Nnodes = 3, 
    redeclare package FlueGasMedium = ThermoPower.Media.AmmoniaGas, 
    redeclare package FluidMedium = ThermoPower.Media.AmmoniaGas, 
    phex = 100000, 
    whex = 2, 
    hexFVb(redeclare package Medium = Media.FlueGas, 
      wnom
       = 1, 
      L
       = 5, 
      pstart
       = 100000, 
      Tstartbar
       = 323.15, 
      Tstartin
       = 323.15, 
      Tstartout
       = 323.15, 
      Cfnom
       = 0.1, 
      FFtype
       = Choices.Flow1D.FFtypes.Cfnom, 
      Kfc
       = 0.5), 
    hexFVa(redeclare package Medium = ThermoPower.Media.AmmoniaGas, pstart
       = 100000, 
      Tstartbar
       = 298.15, 
      Tstartin
       = 298.15, 
      Tstartout
       = 323.15, 
      Cfnom
       = 0.03), 
    gasIn1(redeclare package Medium = ThermoPower.Media.FlueGas), 
    gasOut1(redeclare package Medium = ThermoPower.Media.FlueGas), 
    Cfhex = 0.1, 
    SSInit = true, Tstartbar_M = 473.15, Tstartbar_G = 373.15)
    annotation (Placement(transformation(origin = {258.07211009174307, -89.00000000000003}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Gas.FlowJoin flowJoin1(redeclare package Medium = Media.AmmoniaGas)
    annotation (Placement(transformation(origin = {108.0, 195.99999999999991}, 
      extent = {{-10.0, 10.0}, {10.0, -10.0}})));
  Gas.SinkPressure H5(redeclare package Medium = Media.AmmoniaGas, 
    use_in_T = false, use_in_X = false, 
    use_in_p0 = false, 
    p0 = 100000)
    annotation (Placement(transformation(origin = {-5.4418577981652305, 171.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Gas.SinkPressure H4(redeclare package Medium = Media.FlueGas, 
    use_in_T = false, use_in_X = false, 
    use_in_p0 = false, 
    p0 = 100000)
    annotation (Placement(transformation(origin = {98.0, 133.53274846925285}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  NH3.heatexchangerrr HX7(Dehex = 0.2, 
    Lhex = 50, 
    Dihex = 0.15, 
    Nnodes = 3, 
    redeclare package FlueGasMedium = ThermoPower.Media.AmmoniaGas, 
    redeclare package FluidMedium = ThermoPower.Media.AmmoniaGas, 
    phex = 100000, 
    whex = 2, 
    hexFVb(redeclare package Medium = Media.FlueGas, 
      wnom
       = 1, 
      L
       = 5, 
      pstart
       = 100000, 
      Tstartbar
       = 303.15, 
      Tstartin
       = 303.15, 
      Tstartout
       = 303.15, 
      Cfnom
       = 0.2, 
      FFtype
       = Choices.Flow1D.FFtypes.Cfnom), 
    hexFVa(redeclare package Medium = ThermoPower.Media.AmmoniaGas, pstart
       = 100000, 
      Tstartbar
       = 298.15, 
      Tstartin
       = 298.15, 
      Tstartout
       = 323.15, 
      Cfnom
       = 0.2, 
      Kfc
       = 0.5), 
    gasIn1(redeclare package Medium = ThermoPower.Media.FlueGas), 
    gasOut1(redeclare package Medium = ThermoPower.Media.FlueGas), 
    Cfhex = 0.3, 
    SSInit = true, Tstartbar_M = 473.15, Tstartbar_G = 373.15)
    annotation (Placement(transformation(origin = {85.5910435779817, 46.23099387701134}, 
      extent = {{-10.0, 10.0}, {10.0, -10.0}})));
  Gas.SinkPressure P1(redeclare package Medium = ThermoPower.Media.AmmoniaGas, 
    use_in_T = false, use_in_X = false)
    annotation (Placement(transformation(origin = {130.8530619266054, 46.00000000000003}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));



  Gas.SourcePressure NH3_sourcePressure(redeclare package Medium = Media.AmmoniaGas, p0 = 2e6)
    annotation (Placement(transformation(origin = {-481.99999999999994, -85.00000000000004}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Gas.ValveLin valveLin(Kv = 0.4 / 20e5, redeclare package Medium = Media.AmmoniaGas)
    annotation (Placement(transformation(origin = {-437.99999999999994, -85.00000000000004}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Gas.ValveLin valveLin1(redeclare package Medium = Media.AmmoniaGas, Kv = 0.4 / 12e5)
    annotation (Placement(transformation(origin = {-320.0, -85.00000000000004}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Blocks.Sources.Ramp ramp1(offset = 12, height = 0, duration = 0, 
    startTime = 3) annotation (Placement(transformation(origin = {-383.00000000000006, -9.500000000000064}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Blocks.Sources.Constant const(k = 1.03)
    annotation (Placement(transformation(origin = {-459.99999999999994, -61.99999999999994}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Gas.ValveLin valveLin3(redeclare package Medium = Media.AmmoniaGas, Kv = 0.4 / 10.5e5)
    annotation (Placement(transformation(origin = {-204.0, 15.769006122988678}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Gas.FlowSplit flowSplit(redeclare package Medium = Media.AmmoniaGas)
    annotation (Placement(transformation(origin = {-294.0, -85.00000000000006}, 
      extent = {{-10.0, 10.0}, {10.0, -10.0}})));
  Gas.Header volume1(redeclare package Medium = Media.AmmoniaGas, V = 0.1, pstart = 4.999999999999999e5)
    annotation (Placement(transformation(origin = {-212.5, -89.99999999999999}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Gas.ValveLin valveLin2(Kv = 0.4 / 9e5, redeclare package Medium = Media.AmmoniaGas)
    annotation (Placement(transformation(origin = {-156.00000000000003, -89.99999999999999}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Gas.Header volume(redeclare package Medium = Media.AmmoniaGas, V = 0.1, pstart = 9.999999999999999e5)
    annotation (Placement(transformation(origin = {-364.0, -85.00000000000004}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Blocks.Math.Gain Pa2bar(k = 1e-5) annotation (Placement(transformation(origin = {-362.00000000000006, -43.500000000000114}, 
    extent = {{-5.0, -5.0}, {5.0, 5.0}})));



  Gas.ValveLin valveLin4(Kv = 1 / 6.4e5, redeclare package Medium = Media.AmmoniaGas)
    annotation (Placement(transformation(origin = {13.999999999999996, -89.99999999999997}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));



  Gas.ValveLin valveLin5(Kv = 5e-06, redeclare package Medium = Media.AmmoniaGas)
    annotation (Placement(transformation(origin = {174.0, -89.00000000000004}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Gas.ValveLin valveLin6(Kv = 5e-06, redeclare package Medium = Media.AmmoniaGas)
    annotation (Placement(transformation(origin = {148.0, -206.00000000000006}, 
      extent = {{10.0, -10.0}, {-10.0, 10.0}})));
  Gas.ValveLin valveLin7(Kv = 5e-06, redeclare package Medium = Media.AmmoniaGas)
    annotation (Placement(transformation(origin = {-77.75660550458687, 17.769006122988678}, 
      extent = {{10.0, -10.0}, {-10.0, 10.0}}, 
      rotation = -90.0)));
  Modelica.Blocks.Sources.Constant const3(k = 3)
    annotation (Placement(transformation(origin = {-36.055894495412716, 17.769006122988678}, 
      extent = {{10.0, -10.0}, {-10.0, 10.0}})));



  Modelica.Blocks.Sources.Constant const6(k = 4)
    annotation (Placement(transformation(origin = {-10.0, -61.999999999999986}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Blocks.Sources.Constant const7(k = 4)
    annotation (Placement(transformation(origin = {154.0, -62.00000000000001}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));



  Gas.ValveLin valveLin8(Kv = 1 / 5e5, redeclare package Medium = Media.FlueGas)
    annotation (Placement(transformation(origin = {254.0, 34.12438633820867}, 
      extent = {{-10.0, 10.0}, {10.0, -10.0}}, 
      rotation = -90.0)));
  Modelica.Blocks.Sources.Constant const8(k = 4)
    annotation (Placement(transformation(origin = {110.0, 8.000000000000005}, 
      extent = {{10.0, -10.0}, {-10.0, 10.0}})));
  Gas.ValveLin valveLin9(Kv = 1 / 4e5, redeclare package Medium = Media.FlueGas)
    annotation (Placement(transformation(origin = {84.73798165137624, 7.999999999999995}, 
      extent = {{10.0, 10.0}, {-10.0, -10.0}}, 
      rotation = 90.0)));
  Modelica.Blocks.Sources.Constant const9(k = 3)
    annotation (Placement(transformation(origin = {334.0, -61.999999999999986}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Gas.Header volume2(redeclare package Medium = Media.AmmoniaGas, V = 0.1, pstart = 100000)
    annotation (Placement(transformation(origin = {199.99999999999997, -206.00000000000006}, 
      extent = {{10.0, -10.0}, {-10.0, 10.0}})));
  Gas.ValveLin valveLin10(Kv = 5e-06, redeclare package Medium = Media.AmmoniaGas)
    annotation (Placement(transformation(origin = {360.0, -89.00000000000003}, 
      extent = {{10.0, -10.0}, {-10.0, 10.0}})));



  Gas.ValveLin valveLin11(Kv = 5e-06, redeclare package Medium = Media.AmmoniaGas)
    annotation (Placement(transformation(origin = {316.0, 192.99999999999991}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Gas.Header volume3(redeclare package Medium = Media.FlueGas, V = 0.1, pstart = 100000)
    annotation (Placement(transformation(origin = {264.6216972477065, 66.13099387701148}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}}, 
      rotation = -180.0)));
  Modelica.Blocks.Sources.Ramp ramp3(offset = 7.6, height = 0, duration = 0, 
    startTime = 3) annotation (Placement(transformation(origin = {210.75660550458704, -149.49999999999997}, 
      extent = {{10.0, -10.0}, {-10.0, 10.0}})));
  Modelica.Blocks.Math.Gain Pa2bar1(k = 1e-5) annotation (Placement(transformation(origin = {216.99999999999997, -176.0}, 
    extent = {{5.0, -5.0}, {-5.0, 5.0}})));
  Modelica.Blocks.Sources.Ramp ramp4(offset = 5, height = 0, duration = 0, 
    startTime = 3) annotation (Placement(transformation(origin = {276.0, 122.00000000000001}, 
      extent = {{10.0, -10.0}, {-10.0, 10.0}})));
  tankcontrol.SensTPM sensTPM1(redeclare package Medium = Media.AmmoniaGas)
    annotation (Placement(transformation(origin = {-120.1899082568805, -85.99999999999999}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  tankcontrol.SensTPM sensTPM2(redeclare package Medium = Media.AmmoniaGas)
    annotation (Placement(transformation(origin = {-82.0, -46.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}}, 
      rotation = 90.0)));
  tankcontrol.SensTPM sensTPM3(redeclare package Medium = Media.AmmoniaGas)
    annotation (Placement(transformation(origin = {-44.0, -85.99999999999997}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  tankcontrol.SensTPM sensTPM4(redeclare package Medium = Media.AmmoniaGas)
    annotation (Placement(transformation(origin = {-82.0, -120.00000000000003}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}}, 
      rotation = 90.0)));
  tankcontrol.SensTPM sensTPM5(redeclare package Medium = Media.AmmoniaGas)
    annotation (Placement(transformation(origin = {122.0, -85.00000000000004}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  tankcontrol.SensTPM sensTPM6(redeclare package Medium = Media.AmmoniaGas)
    annotation (Placement(transformation(origin = {226.0, -85.00000000000003}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  tankcontrol.SensTPM sensTPM7(redeclare package Medium = Media.AmmoniaGas)
    annotation (Placement(transformation(origin = {290.14422018348614, -85.00000000000003}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  tankcontrol.SensTPM sensTPM8(redeclare package Medium = Media.AmmoniaGas)
    annotation (Placement(transformation(origin = {382.0, -171.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}}, 
      rotation = 90.0)));
  tankcontrol.SensTPM sensTPM9(redeclare package Medium = Media.AmmoniaGas)
    annotation (Placement(transformation(origin = {251.99999999999994, -202.00000000000009}, 
      extent = {{10.0, -10.0}, {-10.0, 10.0}})));
  tankcontrol.SensTPM sensTPM10(redeclare package Medium = Media.AmmoniaGas)
    annotation (Placement(transformation(origin = {-83.26201834862368, 95.33099387701125}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}}, 
      rotation = 90.0)));
  tankcontrol.SensTPM sensTPM11(redeclare package Medium = Media.AmmoniaGas)
    annotation (Placement(transformation(origin = {-25.999999999999996, 193.99999999999991}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  tankcontrol.SensTPM sensTPM12(redeclare package Medium = Media.FlueGas)
    annotation (Placement(transformation(origin = {298.0, 72.83099387701137}, 
      extent = {{-10.0, 10.0}, {10.0, -10.0}}, 
      rotation = -180.0)));
  tankcontrol.SensTPM sensTPM13(redeclare package Medium = Media.FlueGas)
    annotation (Placement(transformation(origin = {174.0, -120.00000000000004}, 
      extent = {{-10.0, 10.0}, {10.0, -10.0}}, 
      rotation = -180.0)));
  tankcontrol.SensTPM sensTPM14(redeclare package Medium = Media.FlueGas)
    annotation (Placement(transformation(origin = {80.73798165137624, -54.999999999999986}, 
      extent = {{-10.0, 10.0}, {10.0, -10.0}}, 
      rotation = -90.0)));
  tankcontrol.SensTPM sensTPM15(redeclare package Medium = Media.FlueGas)
    annotation (Placement(transformation(origin = {81.5910435779817, 80.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}}, 
      rotation = 90.0)));
  tankcontrol.SensTPM sensTPM16(redeclare package Medium = Media.AmmoniaGas)
    annotation (Placement(transformation(origin = {-401.0, -81.00000000000006}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  NH3.heatexchangerrr HX8(Dehex = 0.2, 
    Lhex = 50, 
    Dihex = 0.15, 
    Nnodes = 3, 
    redeclare package FlueGasMedium = ThermoPower.Media.AmmoniaGas, 
    redeclare package FluidMedium = ThermoPower.Media.AmmoniaGas, 
    phex = 100000, 
    whex = 2, 
    hexFVb(redeclare package Medium = Media.AmmoniaGas, 
      wnom
       = 1, 
      L
       = 5, 
      pstart
       = 100000, 
      Tstartbar
       = 303.15, 
      Tstartin
       = 303.15, 
      Tstartout
       = 303.15, 
      Cfnom
       = 0.2, 
      FFtype
       = Choices.Flow1D.FFtypes.Cfnom), 
    hexFVa(redeclare package Medium = ThermoPower.Media.AmmoniaGas, pstart
       = 100000, 
      Tstartbar
       = 298.15, 
      Tstartin
       = 298.15, 
      Tstartout
       = 323.15, 
      Cfnom
       = 0.2, 
      Kfc
       = 0.5), 
    gasIn1(redeclare package Medium = ThermoPower.Media.AmmoniaGas), 
    gasOut1(redeclare package Medium = ThermoPower.Media.AmmoniaGas), 
    Cfhex = 0.3, 
    SSInit = true, Tstartbar_M = 473.15, Tstartbar_G = 373.15)
    annotation (Placement(transformation(origin = {-79.26201834862368, 66.3619877540228}, 
      extent = {{-10.0, 10.0}, {10.0, -10.0}})));
  Gas.SinkPressure P2(redeclare package Medium = ThermoPower.Media.AmmoniaGas, 
    use_in_T = false, use_in_X = false)
    annotation (Placement(transformation(origin = {-34.0, 66.13099387701149}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));



  tankcontrol.SensTPM sensTPM17(redeclare package Medium = Media.AmmoniaGas)
    annotation (Placement(transformation(origin = {-270.0, 19.769006122988674}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));

  tankcontrol.SensTPM sensTPM18(redeclare package Medium = Media.AmmoniaGas)
    annotation (Placement(transformation(origin = {-100.0, 222.3809938770112}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  tankcontrol.SensTPM sensTPM(redeclare package Medium = Media.AmmoniaGas)
    annotation (Placement(transformation(origin = {-186.59495412844026, -86.00000000000003}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Gas.Header volume4(redeclare package Medium = Media.AmmoniaGas, V = 0.1, pstart = 4.999999999999999e5)
    annotation (Placement(transformation(origin = {-228.5, 15.769006122988678}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Blocks.Sources.Ramp ramp6(offset = 10.5, height = 0, duration = 0, 
    startTime = 3) annotation (Placement(transformation(origin = {-294.0, 80.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Blocks.Math.Gain Pa2bar4(k = 1e-5) annotation (Placement(transformation(origin = {-252.0, 59.130993877011484}, 
    extent = {{-5.0, -5.0}, {5.0, 5.0}})));
  Modelica.Blocks.Sources.Constant const11(k = 3.6)
    annotation (Placement(transformation(origin = {-178.0, -53.999999999999986}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Gas.ValveLin valveLin12(Kv = 0.4 / 10e5, redeclare package Medium = Media.AmmoniaGas)
    annotation (Placement(transformation(origin = {-253.24999999999997, -89.99999999999999}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Blocks.Sources.Constant const12(k = 4)
    annotation (Placement(transformation(origin = {-234.0, -61.999999999999964}, 
      extent = {{10.0, -10.0}, {-10.0, 10.0}})));
  tankcontrol.SensTPM sensTPM19(redeclare package Medium = Media.AmmoniaGas)
    annotation (Placement(transformation(origin = {204.0, 199.99999999999991}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Blocks.Sources.Ramp ramp5(offset = 5, height = 0, duration = 0, 
    startTime = 3) annotation (Placement(transformation(origin = {340.0, 230.0}, 
      extent = {{10.0, -10.0}, {-10.0, 10.0}})));
  PowerPlants.Control.PID pID2(
    PVmax = 15, 
    PVmin = 1, 
    CSmin = 0.01, 
    CSmax = 16, 
    Ti = 500, 
    Kp = -3, 
    steadyStateInit = true, 
    PVstart = 3, 
    CSstart = 0.1) annotation (Placement(transformation(origin = {223.99999999999997, 118.0}, 
      extent = {{10.0, -10.0}, {-10.0, 10.0}})));
  Modelica.Blocks.Math.Gain Pa2bar2(k = 1e-5) annotation (Placement(transformation(origin = {255.02373853210992, 88.25081649341931}, 
    extent = {{5.0, -5.0}, {-5.0, 5.0}})));
  Gas.FlowSplit flowSplit1(redeclare package Medium = Media.AmmoniaGas)
    annotation (Placement(transformation(origin = {-57.99999999999997, -177.9}, 
      extent = {{-10.0, 10.0}, {10.0, -10.0}})));
  Gas.SinkPressure leaksink(redeclare package Medium = Media.AmmoniaGas, p0 = 2e5)
    annotation (Placement(transformation(origin = {42.0, -181.9}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Blocks.Sources.Ramp ramp2(height = 0, startTime = 20000, 
    duration = 1000)

    annotation (Placement(transformation(origin = {-9.999999999999998, -153.49999999999994}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Gas.ValveLin valveLin13(redeclare package Medium = Media.AmmoniaGas, Kv = 0.5 / 1e5)
    annotation (Placement(transformation(origin = {3.0, -181.9}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Gas.SourceMassFlow CombAir1(redeclare package Medium = Media.AmmoniaGas, 
    w0 = 0.3, 
    T = 298.15, 
    use_in_w0 = true, 
    p0 = 9.999999999999999e5)


    annotation (Placement(transformation(origin = {-124.52403669724737, 66.13099387701146}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Blocks.Sources.Ramp ramp7(offset = 273.15, height = 50, duration = 0, 
    startTime = 0) annotation (Placement(transformation(origin = {-96.00000000000001, 118.0}, 
      extent = {{10.0, -10.0}, {-10.0, 10.0}})));
  PowerPlants.Control.PID pID3(
    PVmax = 15, 
    PVmin = 1, 
    CSmin = 0.01, 
    CSmax = 16, 
    Ti = 500, 
    Kp = -3, 
    steadyStateInit = true, 
    PVstart = 3, 
    CSstart = 0.1) annotation (Placement(transformation(origin = {-140.0, 114.0}, 
      extent = {{10.0, -10.0}, {-10.0, 10.0}})));
  Modelica.Blocks.Sources.Ramp ramp8(offset = 273.15, height = 80, duration = 0, 
    startTime = 0) annotation (Placement(transformation(origin = {58.56061926605504, 106.33099387701127}, 
      extent = {{10.0, -10.0}, {-10.0, 10.0}})));
  PowerPlants.Control.PID pID5(
    PVmax = 15, 
    PVmin = 1, 
    CSmin = 0.01, 
    CSmax = 16, 
    Ti = 500, 
    Kp = -3, 
    steadyStateInit = true, 
    PVstart = 3, 
    CSstart = 0.1) annotation (Placement(transformation(origin = {25.795521788990847, 102.33099387701127}, 
      extent = {{10.0, -10.0}, {-10.0, 10.0}})));
  Gas.SourceMassFlow CombAir2(redeclare package Medium = Media.AmmoniaGas, 
    w0 = 0.3, 
    T = 298.15, 
    use_in_w0 = true, 
    p0 = 9.999999999999999e5)


    annotation (Placement(transformation(origin = {25.795521788990854, 46.23099387701134}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  PowerPlants.Control.PID pID1(
    PVmax = 300, 
    PVmin = 1, 
    CSmin = 0.01, 
    CSmax = 16, 
    Ti = 500, 
    Kp = -3, 
    steadyStateInit = true, 
    PVstart = 3, 
    CSstart = 0.1) annotation (Placement(transformation(origin = {174.0, -153.49999999999997}, 
      extent = {{10.0, -10.0}, {-10.0, 10.0}})));
  PowerPlants.Control.PID pID6(
    PVmax = 15, 
    PVmin = 1, 
    CSmin = 0.01, 
    CSmax = 16, 
    Ti = 500, 
    Kp = -3, 
    steadyStateInit = true, 
    PVstart = 3, 
    CSstart = 0.1) annotation (Placement(transformation(origin = {-338.0, -13.500000000000066}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  PowerPlants.Control.PID pID7(
    PVmax = 15, 
    PVmin = 1, 
    CSmin = 0.01, 
    CSmax = 16, 
    Ti = 500, 
    Kp = -3, 
    steadyStateInit = true, 
    PVstart = 3, 
    CSstart = 0.1) annotation (Placement(transformation(origin = {-228.5, 76.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
equation 
  connect(convection.solid, heatCapacitor1.port)
    annotation (Line(origin = {401.9999999999997, -255.00000000000006}, 
      points = {{-10.0, 5.0}, {24.0, 5.0}, {24.0, 3.0}}, 
      color = {191, 0, 0}));
  connect(thermalConductance.y, convection.Gc)
    annotation (Line(origin = {377.49999999999983, -240.0}, 
      points = {{-5.0, 0.0}, {5.0, 0.0}}, 
      color = {0, 0, 127}));
  connect(NH3_cracking.thermalPort, convection.fluid)
    annotation (Line(origin = {395.3876146788993, -220.8256136617913}, 
      points = {{-9.0, 9.0}, {-9.0, -9.0}, {-3.0, -9.0}}, 
      color = {191, 0, 0}));
  connect(Empty.flange, NH3_cracking.ina)
    annotation (Line(origin = {419.38761467889907, -206.00000000000003}, 
      points = {{-9.0, 4.0}, {-23.0, 4.0}}, 
      color = {0, 0, 0}));
  connect(CombAir.flange, Combustor1.ina)
    annotation (Line(origin = {287.07211009174296, 27.051712433907568}, 
      points = {{85.0, 39.0}, {63.0, 39.0}}, 
      color = {0, 0, 0}));
  connect(convection1.solid, heatCapacitor2.port)
    annotation (Line(origin = {379.3930275229359, -4.0000000000000515}, 
      points = {{-21.0, 17.0}, {0.0, 17.0}, {0.0, 12.0}}, 
      color = {191, 0, 0}));
  connect(thermalConductance1.y, convection1.Gc)
    annotation (Line(origin = {354.8930275229359, 10.999999999999948}, 
      points = {{-32.0, 12.0}, {-6.0, 12.0}}, 
      color = {0, 0, 127}));
  connect(Combustor1.thermalPort, convection1.fluid)
    annotation (Line(origin = {401.02403669724765, 10.684297646412716}, 
      points = {{-61.0, 45.0}, {-60.0, 45.0}, {-60.0, 23.0}, {-43.0, 23.0}}, 
      color = {191, 0, 0}));
  connect(PSA.out2, H5.flange)
    annotation (Line(origin = {6.243394495413099, 191.72561366179153}, 
      points = {{-64.0, -21.0}, {-22.0, -21.0}}, 
      color = {0, 0, 0}));
  connect(HX7.gasOut, P1.flange)
    annotation (Line(origin = {116.59104357798167, 46.23099387701137}, 
      points = {{-21.0, 0.0}, {4.0, 0.0}}, 
      color = {0, 0, 0}));
  connect(const.y, valveLin.cmd)
    annotation (Line(origin = {-331.5000000000001, -29.000000000000043}, 
      points = {{-117.0, -33.0}, {-106.0, -33.0}, {-106.0, -49.0}}, 
      color = {0, 0, 127}));
  connect(NH3_sourcePressure.flange, valveLin.inlet)
    annotation (Line(origin = {-471.5000000000001, -81.00000000000004}, 
      points = {{0.0, -4.0}, {24.0, -4.0}}, 
      color = {0, 0, 0}));
  connect(valveLin1.outlet, flowSplit.inlet)
    annotation (Line(origin = {-302.50000000000006, -85.00000000000006}, 
      points = {{-7.0, 0.0}, {3.0, 0.0}}, 
      color = {0, 0, 0}));
  connect(flowSplit.outlet2, sensTPM17.inlet)
    annotation (Line(origin = {-229.99999999999991, -133.5000000000001}, 
      points = {{-58.0, 53.0}, {-60.0, 53.0}, {-60.0, 149.0}, {-46.0, 149.0}}, 
      color = {0, 0, 0}));
  connect(valveLin1.inlet, volume.outlet)
    annotation (Line(origin = {-332.50000000000006, -85.00000000000006}, 
      points = {{3.0, 0.0}, {-21.0, 0.0}}, 
      color = {0, 0, 0}));
  connect(valveLin4.outlet, HX4.gasIn)
    annotation (Line(origin = {50.0, -89.0}, 
      points = {{-26.0, -1.0}, {25.0, -1.0}, {25.0, 0.0}}, 
      color = {0, 0, 0}));
  connect(const6.y, valveLin4.cmd)
    annotation (Line(origin = {6.0, -78.0}, 
      points = {{-5.0, 16.0}, {10.0, 16.0}, {10.0, -5.0}, {8.0, -5.0}}, 
      color = {0, 0, 127}));
  connect(const7.y, valveLin5.cmd)
    annotation (Line(origin = {115.0, -116.0}, 
      points = {{50.0, 54.0}, {59.0, 54.0}, {59.0, 34.0}}, 
      color = {0, 0, 127}));
  connect(const3.y, valveLin7.cmd)
    annotation (Line(origin = {-38.0, -72.0}, 
      points = {{-9.0, 90.0}, {-33.0, 90.0}}, 
      color = {0, 0, 127}));
  connect(valveLin8.outlet, HX5.gasIn1)
    annotation (Line(origin = {258.0, -32.0}, 
      points = {{-4.0, 56.0}, {-4.0, -47.0}, {0.0, -47.0}}, 
      color = {0, 0, 0}));
  connect(HX7.gasIn1, valveLin9.inlet)
    annotation (Line(origin = {85.0, 15.0}, 
      points = {{1.0, 21.0}, {1.0, 3.0}, {0.0, 3.0}}, 
      color = {0, 0, 0}));
  connect(const8.y, valveLin9.cmd)
    annotation (Line(origin = {95.0, -15.0}, 
      points = {{4.0, 23.0}, {-3.0, 23.0}}, 
      color = {0, 0, 127}));

  connect(valveLin6.inlet, volume2.outlet)
    annotation (Line(origin = {237.0, -206.0}, 
      points = {{-79.0, 0.0}, {-47.0, 0.0}}, 
      color = {0, 0, 0}));
  connect(valveLin10.cmd, const9.y)
    annotation (Line(origin = {352.0, -118.0}, 
      points = {{8.0, 36.0}, {8.0, 56.0}, {-7.0, 56.0}}, 
      color = {0, 0, 127}));
  connect(volume3.outlet, valveLin8.inlet)
    annotation (Line(origin = {258.0, 8.0}, 
      points = {{-3.0, 58.0}, {-3.0, 36.0}, {-4.0, 36.0}}, 
      color = {0, 0, 0}));
  connect(HX2.gasIn, sensTPM1.outlet)
    annotation (Line(origin = {-101.0, -90.0}, 
      points = {{13.0, 0.0}, {-13.0, 0.0}}, 
      color = {0, 0, 0}));
  connect(valveLin2.outlet, sensTPM1.inlet)
    annotation (Line(origin = {-141.0, -90.0}, 
      points = {{-5.0, 0.0}, {15.0, 0.0}}, 
      color = {0, 0, 0}));
  connect(HX2.gasIn1, sensTPM4.outlet)
    annotation (Line(origin = {-78.0, -118.0}, 
      points = {{0.0, 18.0}, {0.0, 4.0}}, 
      color = {0, 0, 0}));
  connect(HX2.gasOut, sensTPM3.inlet)
    annotation (Line(origin = {-59.0, -90.0}, 
      points = {{-9.0, 0.0}, {9.0, 0.0}}, 
      color = {0, 0, 0}));
  connect(sensTPM3.outlet, valveLin4.inlet)
    annotation (Line(origin = {-17.0, -90.0}, 
      points = {{-21.0, 0.0}, {21.0, 0.0}}, 
      color = {0, 0, 0}));
  connect(sensTPM2.inlet, HX2.gasOut1)
    annotation (Line(origin = {-78.0, -66.0}, 
      points = {{0.0, 14.0}, {0.0, -14.0}}, 
      color = {0, 127, 255}));
  connect(valveLin7.inlet, sensTPM2.outlet)
    annotation (Line(origin = {-78.0, -16.0}, 
      points = {{0.0, 24.0}, {0.0, -24.0}}, 
      color = {0, 0, 0}));
  connect(HX4.gasOut, sensTPM5.inlet)
    annotation (Line(origin = {105.0, -89.0}, 
      points = {{-10.0, 0.0}, {11.0, 0.0}}, 
      color = {0, 0, 0}));
  connect(sensTPM5.outlet, valveLin5.inlet)
    annotation (Line(origin = {146.0, -89.0}, 
      points = {{-18.0, 0.0}, {18.0, 0.0}}, 
      color = {0, 0, 0}));
  connect(valveLin5.outlet, sensTPM6.inlet)
    annotation (Line(origin = {202.0, -89.0}, 
      points = {{-18.0, 0.0}, {18.0, 0.0}}, 
      color = {0, 0, 0}));
  connect(HX5.gasIn, sensTPM6.outlet)
    annotation (Line(origin = {240.0, -89.0}, 
      points = {{8.0, 0.0}, {-8.0, 0.0}}, 
      color = {0, 0, 0}));
  connect(HX5.gasOut, sensTPM7.inlet)
    annotation (Line(origin = {276.0, -89.0}, 
      points = {{-8.0, 0.0}, {8.0, 0.0}}, 
      color = {0, 0, 0}));
  connect(valveLin10.outlet, sensTPM7.outlet)
    annotation (Line(origin = {323.0, -89.0}, 
      points = {{27.0, 0.0}, {-27.0, 0.0}}, 
      color = {0, 0, 0}));
  connect(valveLin10.inlet, sensTPM8.outlet)
    annotation (Line(origin = {378.0, -105.0}, 
      points = {{-8.0, 16.0}, {8.0, 16.0}, {8.0, -60.0}}, 
      color = {0, 0, 0}));
  connect(sensTPM8.inlet, NH3_cracking.inf)
    annotation (Line(origin = {394.0, -165.0}, 
      points = {{-8.0, -12.0}, {-8.0, -27.0}}, 
      color = {0, 0, 0}));
  connect(volume2.inlet, sensTPM9.outlet)
    annotation (Line(origin = {228.0, -206.0}, 
      points = {{-18.0, 0.0}, {18.0, 0.0}}, 
      color = {0, 0, 0}));
  connect(sensTPM9.inlet, NH3_cracking.out)
    annotation (Line(origin = {327.0, -204.0}, 
      points = {{-69.0, -2.0}, {49.0, -2.0}, {49.0, 2.0}}, 
      color = {0, 0, 0}));
  connect(sensTPM9.p, Pa2bar1.u)
    annotation (Line(origin = {244.0, -186.0}, 
      points = {{1.0, -10.0}, {-21.0, -10.0}, {-21.0, 10.0}}, 
      color = {0, 0, 127}));
  connect(PSA.inf, sensTPM10.outlet)
    annotation (Line(origin = {-78.0, 170.0}, 
      points = {{0.0, 1.0}, {0.0, -69.0}, {-1.0, -69.0}}, 
      color = {0, 0, 0}));
  connect(PSA.out, sensTPM11.inlet)
    annotation (Line(origin = {15.0, 206.0}, 
      points = {{-83.0, -25.0}, {-83.0, -16.0}, {-47.0, -16.0}}, 
      color = {0, 0, 0}));
  connect(sensTPM11.outlet, flowJoin1.inlet1)
    annotation (Line(origin = {165.0, 204.0}, 
      points = {{-185.0, -14.0}, {-63.0, -14.0}, {-63.0, -12.0}}, 
      color = {0, 0, 0}));
  connect(volume3.inlet, sensTPM12.outlet)
    annotation (Line(origin = {294.0, 57.0}, 
      points = {{-19.0, 9.0}, {-2.0, 9.0}, {-2.0, 12.0}}, 
      color = {0, 0, 0}));
  connect(sensTPM12.inlet, Combustor1.out)
    annotation (Line(origin = {317.0, 70.0}, 
      points = {{-13.0, -1.0}, {13.0, -1.0}, {13.0, -4.0}}, 
      color = {0, 0, 0}));
  connect(HX5.gasOut1, sensTPM13.inlet)
    annotation (Line(origin = {222.0, -116.0}, 
      points = {{36.0, 17.0}, {36.0, -8.0}, {-42.0, -8.0}}, 
      color = {0, 0, 0}));
  connect(sensTPM13.outlet, HX4.gasIn1)
    annotation (Line(origin = {130.0, -116.0}, 
      points = {{38.0, -8.0}, {-45.0, -8.0}, {-45.0, 17.0}}, 
      color = {0, 0, 0}));
  connect(valveLin9.outlet, sensTPM14.inlet)
    annotation (Line(origin = {85.0, -15.0}, 
      points = {{0.0, 13.0}, {0.0, -34.0}}, 
      color = {0, 0, 0}));
  connect(sensTPM14.outlet, HX4.gasOut1)
    annotation (Line(origin = {85.0, -59.0}, 
      points = {{0.0, -2.0}, {0.0, -20.0}}, 
      color = {0, 0, 0}));
  connect(H4.flange, sensTPM15.outlet)
    annotation (Line(origin = {86.0, 117.0}, 
      points = {{2.0, 17.0}, {2.0, -31.0}, {0.0, -31.0}}, 
      color = {0, 0, 0}));
  connect(sensTPM15.inlet, HX7.gasOut1)
    annotation (Line(origin = {86.0, 73.0}, 
      points = {{0.0, 1.0}, {0.0, -17.0}}, 
      color = {0, 0, 0}));
  connect(valveLin.outlet, sensTPM16.inlet)
    annotation (Line(origin = {-417.00000000000006, -84.5000000000001}, 
      points = {{-11.0, 0.0}, {10.0, 0.0}}, 
      color = {0, 0, 0}));
  connect(sensTPM16.outlet, volume.inlet)
    annotation (Line(origin = {-384.00000000000006, -84.5000000000001}, 
      points = {{-11.0, 0.0}, {10.0, 0.0}}, 
      color = {0, 0, 0}));
  connect(sensTPM16.p, Pa2bar.u)
    annotation (Line(origin = {-381.00000000000006, -59.5000000000001}, 
      points = {{-13.0, -15.0}, {-8.0, -15.0}, {-8.0, 16.0}, {13.0, 16.0}}, 
      color = {0, 0, 127}));
  connect(sensTPM10.inlet, HX8.gasOut1)
    annotation (Line(origin = {-78.0, 86.0}, 
      points = {{-1.0, 3.0}, {-1.0, -10.0}}, 
      color = {0, 0, 0}));
  connect(HX8.gasIn1, valveLin7.outlet)
    annotation (Line(origin = {-78.0, 42.0}, 
      points = {{-1.0, 14.0}, {-1.0, -14.0}, {0.0, -14.0}}, 
      color = {0, 0, 0}));

  connect(HX8.gasOut, P2.flange)
    annotation (Line(origin = {-56.0, 66.0}, 
      points = {{-13.0, 0.0}, {12.0, 0.0}}, 
      color = {0, 0, 0}));
  connect(valveLin3.outlet, sensTPM18.inlet)
    annotation (Line(origin = {-175.0, 117.0}, 
      points = {{-19.0, -101.0}, {-19.0, 101.0}, {69.0, 101.0}}, 
      color = {0, 0, 0}));
  connect(sensTPM18.outlet, flowJoin1.inlet2)
    annotation (Line(origin = {63.0, 209.0}, 
      points = {{-157.0, 9.0}, {39.0, 9.0}, {39.0, -9.0}}, 
      color = {0, 0, 0}));
  connect(volume1.outlet, sensTPM.inlet)
    annotation (Line(origin = {-226.0, -90.0}, 
      points = {{24.0, 0.0}, {33.0, 0.0}}, 
      color = {0, 0, 0}));
  connect(sensTPM.outlet, valveLin2.inlet)
    annotation (Line(origin = {-191.0, -90.0}, 
      points = {{10.0, 0.0}, {25.0, 0.0}}, 
      color = {0, 0, 0}));
  connect(sensTPM17.outlet, volume4.inlet)
    annotation (Line(origin = {-259.0, 5.0}, 
      points = {{-5.0, 11.0}, {21.0, 11.0}}, 
      color = {0, 0, 0}));
  connect(volume4.outlet, valveLin3.inlet)
    annotation (Line(origin = {-206.0, 16.0}, 
      points = {{-13.0, 0.0}, {-8.0, 0.0}}, 
      color = {0, 0, 0}));
  connect(Pa2bar4.u, sensTPM17.p)
    annotation (Line(origin = {-261.0, 29.0}, 
      points = {{3.0, 30.0}, {3.0, -3.0}, {-2.0, -3.0}}, 
      color = {0, 0, 127}));
  connect(const11.y, valveLin2.cmd)
    annotation (Line(origin = {-172.0, -61.0}, 
      points = {{5.0, 7.0}, {16.0, 7.0}, {16.0, -22.0}}, 
      color = {0, 0, 127}));
  connect(volume1.inlet, valveLin12.outlet)
    annotation (Line(origin = {-233.0, -90.0}, 
      points = {{11.0, 0.0}, {-10.0, 0.0}}, 
      color = {0, 0, 0}));
  connect(valveLin12.cmd, const12.y)
    annotation (Line(origin = {-249.0, -72.0}, 
      points = {{-4.0, -11.0}, {-4.0, 10.0}, {4.0, 10.0}}, 
      color = {0, 0, 127}));
  connect(valveLin11.outlet, Combustor1.inf)
    annotation (Line(origin = {333.0, 135.0}, 
      points = {{-7.0, 58.0}, {6.0, 58.0}, {6.0, -59.0}, {7.0, -59.0}}, 
      color = {0, 0, 0}));
  connect(flowJoin1.outlet, sensTPM19.inlet)
    annotation (Line(origin = {156.0, 196.0}, 
      points = {{-42.0, 0.0}, {42.0, 0.0}}, 
      color = {0, 0, 0}));
  connect(sensTPM19.outlet, valveLin11.inlet)
    annotation (Line(origin = {258.0, 195.0}, 
      points = {{-48.0, 1.0}, {48.0, 1.0}, {48.0, -2.0}}, 
      color = {0, 0, 0}));
  connect(ramp5.y, valveLin11.cmd)
    annotation (Line(origin = {323.0, 215.0}, 
      points = {{6.0, 15.0}, {-7.0, 15.0}, {-7.0, -15.0}}, 
      color = {0, 0, 127}));
  connect(pID2.CS, valveLin8.cmd)
    annotation (Line(origin = {256.0, 78.0}, 
      points = {{-42.0, 40.0}, {-50.0, 40.0}, {-50.0, -44.0}, {-9.0, -44.0}}, 
      color = {0, 0, 127}));
  connect(ramp4.y, pID2.SP)
    annotation (Line(origin = {250.0, 122.0}, 
      points = {{15.0, 0.0}, {-16.0, 0.0}}, 
      color = {0, 0, 127}));
  connect(Pa2bar2.u, sensTPM12.p)
    annotation (Line(origin = {276.0, 84.0}, 
      points = {{-15.0, 4.0}, {-12.0, 4.0}, {-12.0, -4.0}, {15.0, -4.0}, {15.0, -5.0}}, 
      color = {0, 0, 127}));
  connect(pID2.PV, Pa2bar2.y)
    annotation (Line(origin = {242.0, 101.0}, 
      points = {{-8.0, 13.0}, {-2.0, 13.0}, {-2.0, -13.0}, {8.0, -13.0}}, 
      color = {0, 0, 127}));
  connect(valveLin6.outlet, flowSplit1.inlet)
    annotation (Line(origin = {-43.0, -167.00000000000009}, 
      points = {{181.0, -39.0}, {-37.0, -39.0}, {-37.0, -11.0}, {-21.0, -11.0}}, 
      color = {0, 0, 0}));
  connect(leaksink.flange, valveLin13.outlet)
    annotation (Line(origin = {23.999999999999943, -181.95}, 
      points = {{8.0, 0.0}, {-11.0, 0.0}}, 
      color = {0, 0, 0}));
  connect(ramp2.y, valveLin13.cmd)
    annotation (Line(origin = {-4.0, -169.95}, 
      points = {{5.0, 16.0}, {6.0, 16.0}, {6.0, -5.0}, {7.0, -5.0}}, 
      color = {0, 0, 127}));
  connect(flowSplit1.outlet1, valveLin13.inlet)
    annotation (Line(origin = {-23.000000000000007, -161.89999999999998}, 
      points = {{-29.0, -20.0}, {16.0, -20.0}}, 
      color = {0, 0, 0}));
  connect(flowSplit1.outlet2, sensTPM4.inlet)
    annotation (Line(origin = {-45.0, -160.89999999999998}, 
      points = {{-7.0, -13.0}, {-7.0, 14.0}, {-34.0, 14.0}, {-34.0, 41.0}, {-33.0, 41.0}, {-33.0, 35.0}}, 
      color = {0, 0, 0}));
  connect(flowSplit.outlet1, valveLin12.inlet)
    annotation (Line(origin = {-275.0, -89.0}, 
      points = {{-13.0, 0.0}, {12.0, 0.0}, {12.0, -1.0}}, 
      color = {0, 0, 0}));
  connect(HX8.gasIn, CombAir1.flange)
    annotation (Line(origin = {-102.0, 66.0}, 
      points = {{13.0, 0.0}, {-13.0, 0.0}}, 
      color = {0, 0, 0}));
  connect(pID3.SP, ramp7.y)
    annotation (Line(origin = {-124.0, 118.0}, 
      points = {{-6.0, 0.0}, {17.0, 0.0}}, 
      color = {0, 0, 127}));
  connect(sensTPM10.T, pID3.PV)
    annotation (Line(origin = {-109.0, 117.0}, 
      points = {{17.0, -15.0}, {-21.0, -15.0}, {-21.0, -7.0}}, 
      color = {0, 0, 127}));
  connect(pID3.CS, CombAir1.in_w0)
    annotation (Line(origin = {-139.0, 100.0}, 
      points = {{-11.0, 14.0}, {-20.0, 14.0}, {-20.0, -29.0}, {8.0, -29.0}}, 
      color = {0, 0, 127}));
  connect(pID5.SP, ramp8.y)
    annotation (Line(origin = {32.0, 92.0}, 
      points = {{4.0, 14.0}, {16.0, 14.0}}, 
      color = {0, 0, 127}));
  connect(HX7.gasIn, CombAir2.flange)
    annotation (Line(origin = {56.0, 46.0}, 
      points = {{20.0, 0.0}, {-20.0, 0.0}}, 
      color = {0, 0, 0}));
  connect(pID5.CS, CombAir2.in_w0)
    annotation (Line(origin = {13.0, 70.0}, 
      points = {{3.0, 32.0}, {-6.0, 32.0}, {-6.0, -19.0}, {7.0, -19.0}}, 
      color = {0, 0, 127}));
  connect(sensTPM15.T, pID5.PV)
    annotation (Line(origin = {55.0, 93.0}, 
      points = {{18.0, -6.0}, {-19.0, -6.0}, {-19.0, 5.0}}, 
      color = {0, 0, 127}));
  connect(pID1.SP, ramp3.y)
    annotation (Line(origin = {192.0, -149.0}, 
      points = {{-8.0, 0.0}, {8.0, 0.0}}, 
      color = {0, 0, 127}));
  connect(pID1.PV, Pa2bar1.y)
    annotation (Line(origin = {198.0, -166.0}, 
      points = {{-14.0, 9.0}, {-14.0, -10.0}, {13.0, -10.0}}, 
      color = {0, 0, 127}));
  connect(valveLin6.cmd, pID1.CS)
    annotation (Line(origin = {156.0, -176.0}, 
      points = {{-8.0, -23.0}, {-8.0, 20.0}, {8.0, 20.0}, {8.0, 23.0}}, 
      color = {0, 0, 127}));
  connect(ramp1.y, pID6.SP)
    annotation (Line(origin = {-360.0, -10.0}, 
      points = {{-12.0, 0.0}, {12.0, 0.0}}, 
      color = {0, 0, 127}));
  connect(Pa2bar.y, pID6.PV)
    annotation (Line(origin = {-352.0, -31.0}, 
      points = {{-5.0, -13.0}, {-5.0, 13.0}, {4.0, 13.0}}, 
      color = {0, 0, 127}));
  connect(pID6.CS, valveLin1.cmd)
    annotation (Line(origin = {-324.0, -46.0}, 
      points = {{-4.0, 32.0}, {4.0, 32.0}, {4.0, -32.0}}, 
      color = {0, 0, 127}));
  connect(ramp6.y, pID7.SP)
    annotation (Line(origin = {-261.0, 80.0}, 
      points = {{-22.0, 0.0}, {22.5, 0.0}}, 
      color = {0, 0, 127}));
  connect(Pa2bar4.y, pID7.PV)
    annotation (Line(origin = {-243.0, 66.0}, 
      points = {{-4.0, -7.0}, {4.0, -7.0}, {4.0, 6.0}}, 
      color = {0, 0, 127}));
  connect(pID7.CS, valveLin3.cmd)
    annotation (Line(origin = {-211.0, 50.0}, 
      points = {{-8.0, 26.0}, {7.0, 26.0}, {7.0, -27.0}}, 
      color = {0, 0, 127}));
end Model30125sdh040666;