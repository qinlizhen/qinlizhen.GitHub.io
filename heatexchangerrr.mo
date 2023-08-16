within ThermoPower.NH33;
model heatexchangerrr
  extends Modelica.Icons.Example;
  extends ThermoPower.NH3.HeatExchanger_1(pstart_F = 100000, fluidNomFlowRate = 1);
  replaceable package Medium = ThermoPower.Media.FlueGas
     constrainedby Modelica.Media.Interfaces.PartialMedium;
  parameter Integer Nnodes = 5 "number of nodes";
  parameter Modelica.SIunits.Length Lhex = 30 "total length";
  parameter Modelica.SIunits.Diameter Dihex = 0.2
    "diameter of internal tube";
  parameter Modelica.SIunits.Diameter Dehex = 0.4
    "diameter of external tube";
  parameter Modelica.SIunits.Length omegahex = Modelica.Constants.pi * Dihex
    "wet perimeter of the tube interface";
  parameter Modelica.SIunits.Area Aint = Modelica.Constants.pi * Dihex ^ 2 / 4
    "cross section of internal tube";
  parameter Modelica.SIunits.Area Aext = Modelica.Constants.pi * Dehex ^ 2 / 4 - Aint
    "cross section of external tube";
  parameter Real Cfhex = 0.001 "friction coefficient";
  parameter Modelica.SIunits.MassFlowRate whex = 1
    "nominal (and initial) mass flow rate";
  parameter Modelica.SIunits.Pressure phex = 100000 "initial pressure";
  parameter Modelica.SIunits.SpecificEnthalpy hinhex = 1e5
    "initial inlet specific enthalpy";
  parameter Modelica.SIunits.SpecificEnthalpy houthex = 1e5
    "initial outlet specific enthalpy";


  inner ThermoPower.System system
    annotation (Placement(transformation(origin = {84.0, 84.0}, 
      extent = {{-16.0, -16.0}, {16.0, 16.0}})));//    hstartin = hinhex, 
  //    hstartout = houthex, 
  ThermoPower.Gas.Flow1DFV hexFVb(
    N = Nnodes, 
    Nt = 1, 
    L = Lhex, 
    wnom = 1, 
    Dhyd = 0.1, 
    Cfnom = Cfhex, 


    redeclare package Medium = ThermoPower.Media.AmmoniaGas, 
    HydraulicCapacitance = ThermoPower.Choices.Flow1D.HCtypes.Downstream, 

    redeclare model HeatTransfer = ThermoPower.Thermal.HeatTransferFV.ConstantHeatTransferCoefficient(
      gamma = 800), 
    FFtype = ThermoPower.Choices.Flow1D.FFtypes.Cfnom, 
    A = Aext, 
    omega = omegahex, 
    pstart = 2e5, Tstartin = 573.15, Tstartout = 573.15) annotation (Placement(transformation(origin = {8.881784197001252e-16, 38.99999999999999}, 
      extent = {{-15.999999999999993, -15.999999999999993}, {15.999999999999993, 15.999999999999993}}, 
      rotation = 180.0)));

  //   hstartin = hinhex, 
  //   hstartout = houthex, 
  ThermoPower.Gas.Flow1DFV hexFVa(
    N = Nnodes, 
    L = Lhex, 
    Dhyd = Dihex, 
    wnom = whex, 
    Cfnom = Cfhex, 


    redeclare package Medium = ThermoPower.Media.AmmoniaGas, 
    FFtype = ThermoPower.Choices.Flow1D.FFtypes.Cfnom, 
    HydraulicCapacitance = ThermoPower.Choices.Flow1D.HCtypes.Downstream, 

    redeclare model HeatTransfer = ThermoPower.Thermal.HeatTransferFV.ConstantHeatTransferCoefficient(
      gamma = 800), 
    A = Aint, 
    omega = omegahex, 
    dpnom = 1000, 
    pstart = 2e5, Tstartin = 573.15, Tstartout = 573.15) annotation (Placement(transformation(origin = {-1.7763568394002505e-15, -47.000000000000014}, 
      extent = {{-15.999999999999993, -15.999999999999993}, {15.999999999999993, 15.999999999999993}})));
  ThermoPower.Thermal.CounterCurrentFV counterCurrentFV(Nw = Nnodes - 1)
    annotation (Placement(transformation(origin = {-3.552713678800501e-15, -4.000000000000009}, 
      extent = {{-15.999999999999993, -15.999999999999993}, {15.999999999999993, 15.999999999999995}})));
equation 
  connect(counterCurrentFV.side1, hexFVb.wall) annotation (Line(origin = {-8.0, 3.0}, 
    points = {{8.0, -2.0}, {8.0, 28.0}}, 
    color = {255, 127, 0}, 
    thickness = 1.0));
  connect(counterCurrentFV.side2, hexFVa.wall) annotation (Line(origin = {-8.0, -45.05}, 
    points = {{8.0, 36.0}, {8.0, 6.0}}, 
    color = {255, 127, 0}, 
    thickness = 1.0));
  annotation (Diagram(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, 
    preserveAspectRatio = false, 
    grid = {2.0, 2.0}), graphics = {Text(origin = {-85.5, 33.00000000000001}, 
    lineColor = {0, 0, 0}, 
    extent = {{-30.500000000000014, 10.000000000000014}, {30.5, -10.000000000000007}}, 
    textString = "GasIn", 
    fontSize = 16, 
    textStyle = {TextStyle.Bold}, 
    textColor = {0, 0, 0}), Text(origin = {-39.5, 90.0}, 
    lineColor = {0, 0, 0}, 
    extent = {{-30.5, 10.0}, {30.5, -10.000000000000014}}, 
    textString = "GasIn1", 
    fontSize = 16, 
    textStyle = {TextStyle.Bold}, 
    textColor = {0, 0, 0}), Text(origin = {69.50000000000003, 33.00000000000001}, 
    lineColor = {0, 0, 0}, 
    extent = {{-30.499999999999986, 10.000000000000007}, {30.5, -10.000000000000007}}, 
    textString = "GasOut", 
    fontSize = 16, 
    textStyle = {TextStyle.Bold}, 
    textColor = {0, 0, 0}), Text(origin = {49.49999999999999, -74.0}, 
    lineColor = {0, 0, 0}, 
    extent = {{-30.499999999999993, 9.999999999999986}, {30.499999999999993, -10.0}}, 
    textString = "GasOut1", 
    fontSize = 16, 
    textStyle = {TextStyle.Bold}, 
    textColor = {0, 0, 0})}), 
    experiment(StopTime = 1200, Tolerance = 1e-006), 
    __Dymola_experimentSetupOutput, 
    Documentation(info = "<html>
<p>The model is designed to test the component <code>Water.Flow1DFV</code> (fluid side of a heat exchanger, model uses finite volumes).</p><p>This model represent the two fluid sides of a heat exchanger made by two concentric tubes in counterflow configuration. The thickness of the wall separating the two tubes is negligible. The operating fluid is liquid water. The mass flow rate during the experiment and initial conditions are the same for the two sides. </p><p>During the simulation, the inlet specific enthalpy for hexA (&QUOT;hot side&QUOT;) is changed at time t = 50 s. The outlet temperature of the hot side starts changing after the fluid transport time delay, while the outlet temperature of the cold side starts changing immediately. </p>
<p>Simulation Interval = [0...1200] sec </p><p>Integration Algorithm = DASSL </p><p>Algorithm Tolerance = 1e-6 </p>
</html>", revisions = "<html>
<ul>
<li>18 Sep 2013 by <a href=\"mailto:francesco.casella@polimi.it\">Francesco Casella</a>:<br/>Updated to new FV structure. Updated parameters.</li></li>
<li><i>1 Oct 2003</i> by <a href=\"mailto:francesco.schiavo@polimi.it\">Francesco Schiavo</a>:<br>
First release.</li>
</ul>
</html>"));
  connect(gasIn1, hexFVb.infl)
    annotation (Line(origin = {10.0, 64.0}, 
      points = {{-10.0, 36.0}, {6.0, 36.0}, {6.0, -25.0}}, 
      color = {0, 0, 0}, 
      thickness = 1.0));
  connect(hexFVb.outfl, gasOut1)
    annotation (Line(origin = {-22.0, -33.0}, 
      points = {{6.0, 72.0}, {-22.0, 72.0}, {-22.0, -67.0}, {22.0, -67.0}}, 
      color = {0, 0, 0}, 
      thickness = 1.0));
  connect(gasIn, hexFVa.infl)
    annotation (Line(origin = {-59.0, -36.0}, 
      points = {{-41.0, 36.0}, {-41.0, -11.0}, {43.0, -11.0}}, 
      color = {0, 0, 0}, 
      thickness = 1.0));
  connect(hexFVa.outfl, gasOut)
    annotation (Line(origin = {51.0, -36.0}, 
      points = {{-35.0, -11.0}, {49.0, -11.0}, {49.0, 36.0}}, 
      color = {0, 0, 0}, 
      thickness = 1.0));
end heatexchangerrr;