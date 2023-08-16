within ThermoPower.NH33.combustor;
model NH3cracking_reactor_nickel "Ammonia Cracking Chamber with Nickel Catalyst"
  extends ThermoPower.NH33.NH3base.NH3crackingChamberBase1(

    redeclare package Fuel = ThermoPower.Media.AmmoniaGas "N2, h2, nh3", 
    redeclare package Exhaust = ThermoPower.Media.AmmoniaGas "N2, h2, nh3");
    //redeclare package Air = ThermoPower.Media.Air "O2, H2O, Ar, N2", 



  parameter Real A = 1e7 "Pre-exponential factor for Nickel";
  parameter Real Ea = 80000 "Activation energy for Nickel in J/mol";
  parameter Real R = 8.314 "Gas constant in J/(mol.K)";
  Real T "Local temperature, should be connected to reactor temperature";

  Real k "Reaction rate constant based on Arrhenius equation";
  Real wcomb(final quantity = "MolarFlowRate", unit = "mol/s") "Molar Cracking rate";
protected 
  Fuel.MassFraction inf_X[Fuel.nXi] = inStream(inf.Xi_outflow);
equation 
  T = fluegas.T;
  k = A * exp(-Ea / (R * T));
  wcomb = k * inf_X[3] / Fuel.data[3].MM; // Based on NH3 concentration

  der(MX[1]) = inf.m_flow * inf_X[1] + out.m_flow * fluegas.X[1] + 0.5 * wcomb * Exhaust.data[1].MM; // N2
  der(MX[2]) = inf.m_flow * inf_X[2] + out.m_flow * fluegas.X[2] + 1.5 * wcomb * Exhaust.data[2].MM; // H2
  der(MX[3]) = inf.m_flow * inf_X[3] + out.m_flow * fluegas.X[3] - 1 * wcomb * Exhaust.data[3].MM; // NH3

  // Ensure that the local temperature T is connected or defined elsewhere in the model
  // T = ...;

  annotation (Icon(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, 
    grid = {2.0, 2.0}), graphics = {Text(origin = {-58.0, 89.99999999999999}, 
    lineColor = {0, 0, 0}, 
    extent = {{-62.0, 10.000000000000014}, {62.0, -9.999999999999986}}, 
    textString = "fuel", 
    fontSize = 16, 
    textStyle = {TextStyle.Bold}, 
    textColor = {0, 0, 0}, 
    horizontalAlignment = LinePattern.None)}));
end NH3cracking_reactor_nickel;