within ThermoPower.NH33;
model Combustor "Combustion Chamber"
  import SI = Modelica.SIunits;

  extends ThermoPower.NH33.NH3base.myCombustorBase(
    redeclare package Air = ThermoPower.Media.Air "O2, H2O, Ar, N2", 
    redeclare package Fuel = ThermoPower.Media.AmmoniaGas "N2, H2, NH3", 
    redeclare package Exhaust = ThermoPower.Media.FlueGas "O2, Ar, H2O, CO2, N2");
  Real wcomb_H2(final quantity = "MolarFlowRate", unit = "mol/s")
    "Molar Combustion rate (H2)";
  Real wcomb_NH3(final quantity = "MolarFlowRate", unit = "mol/s")
    "Molar Combustion rate (NH3)";
  /*SI.PerUnit lambda
    "Stoichiometric ratio (>1 if air flow is greater than stoichiometric)";*/
protected 
  Air.MassFraction ina_X[Air.nXi] = inStream(ina.Xi_outflow);
  Fuel.MassFraction inf_X[Fuel.nXi] = inStream(inf.Xi_outflow);
equation 
  wcomb_H2 = inf.m_flow * inf_X[2] / (Fuel.data[2].MM) "Fuel(H2) molar flow rate";
  wcomb_NH3 = inf.m_flow * inf_X[3] / (Fuel.data[3].MM) "Fuel(NH3) molar flow rate";
  /* lambda = (ina.m_flow * ina_X[1] / Air.data[1].MM) / (0.5 * wcomb_H2 + 0.75 * wcomb_NH3);
  assert(lambda >= 1, "Not enough oxygen flow");*/
  der(MX[1]) = ina.m_flow * ina_X[1] + out.m_flow * fluegas.X[1] - (0.75 * wcomb_NH3) * Exhaust.data[1].MM "oxygen";
  der(MX[2]) = ina.m_flow * ina_X[3] + out.m_flow * fluegas.X[2] "argon";
  der(MX[3]) = ina.m_flow * ina_X[2] + out.m_flow * fluegas.X[3] + (1.5 * wcomb_NH3) * Exhaust.data[3].MM "water";
  der(MX[4]) = out.m_flow * fluegas.X[4] "carbondioxide";
  der(MX[5]) = ina.m_flow * ina_X[4] + out.m_flow * fluegas.X[5] + inf.m_flow * inf_X[1] + 0.5 * wcomb_NH3 * Exhaust.data[5].MM "nitrogen";
  annotation (Icon(graphics), Documentation(info = "<html>
This model extends the CombustionChamber Base model, with the definition of the gases.
<p>In particular, the air inlet uses the <tt>Media.Air</tt> medium model, the fuel input uses the <tt>Media.NaturalGas</tt> medium model, and the flue gas outlet uses the <tt>Medium.FlueGas</tt> medium model.
<p>The composition of the outgoing gas is determined by the mass balance of every component, taking into account the combustion reaction CH4+2O2--->2H2O+CO2.</p>
<p>The model assumes complete combustion, so that it is only valid if the oxygen flow at the air inlet is greater than the stoichiometric flow corresponding to the flow at the fuel inlet.</p>

</html>", revisions = "<html>
<ul>
<li><i>31 Jan 2005</i>
    by <a href=\"mailto:francesco.casella@polimi.it\">Francesco Casella</a>:<br>
 Combustion Chamber model restructured using inheritance.
     <p>  First release.
 </li>
</ul>
</html>"));
end Combustor;