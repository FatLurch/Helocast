 /*
 =============================== INFORMATION ===========================
  
 -- isBoat.sqf - Function to determine if a boat is suitable for recovery, loading, etc. Declared as function in config.cpp (fatLurch_fnc_isBoat)
  
 -- By Fat_Lurch (fat.lurch@gmail.com) for ARMA 3
 -- Created: 2019-12-26
 -- Last Edit: 2019-12-26
 -- Parameters: [boat] - the boat to test for suitability
 -- Returns: Boolean

 -- Usage:
 
if([boat] call fatLurch_fnc_isBoat) then...

 ================================== START ==============================
*/

//=========================== DEFINE SUITABLE BOATS ========================

_boatArray=["o_lifeboat","b_t_lifeboat","b_t_boat_transport_01_f","b_boat_transport_01_f","b_lifeboat","o_boat_transport_01_f","o_g_boat_transport_01_f","b_g_boat_transport_01_f","i_boat_transport_01_f","i_g_boat_transport_01_f"];

//===================== CODE =====================
_boat = toLower(typeOf (_this select 0));

//Return
(_boat in _boatArray)
