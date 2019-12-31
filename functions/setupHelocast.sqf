 /*
 =============================== INFORMATION ===========================
  
 -- setupHelocast.sqf - This function setups up a helicopter for helocast and recovery operations. Declared as function in config.cpp (fatLurch_fnc_setupHelocast)
  
 -- By Fat_Lurch (fat.lurch@gmail.com) for ARMA 3
 -- Created: 2019-02-23
 -- Last Edit: 2019-12-28
 -- Parameters: [helo] - the helo to configure for helocasting
 -- Returns: Nothing

 -- Usage:
 
[helo] call fatLurch_fnc_addCRRC;

 ================================== START ==============================
*/

if (!isDedicated && !isServer) exitwith {};

_kill=false;
_helo = _this;

// ===== VEHICLE TYPE DETECTION =====

//push: does the boat need to be slid aft until it falls out of the helo?
//ramp: an array of the animation name of the ramp (if the helo has a ramp, otherwise set as empty array)
//jumpOffset: offsets from vehicle "pos cargo". Used to get around geometry issues
//boatCoords: where does the boat go relative to the helo center
//recover: can the helo reasonably recover a CRRC
//jumpRotation: aircraft relative rotation to face proper direction when jumping
//altOffset: correction factor for aircraft altitiude (defined in delta desired altitude in meters)

switch(typeof _helo) do
{
	//RHS CH-47 series ===========================
	case "RHS_CH_47F_10";
	case "RHS_CH_47F_light";
	case "RHS_CH_47F": 
	{
		_helo setvariable ["boatCoords", [0,-3.4,-1.3], true];
		_helo setvariable ["push",TRUE, true];
		_helo setvariable ["ramp",["ramp"], true];
		_helo setVariable ["recover", true, true];
		_helo setVariable ["jumpRotation", 180, true];
	};
	
	
	
	//RHS CH-53 series ===========================
	case "rhsusf_CH53E_USMC";
	case "rhsusf_CH53E_USMC_D": 
	{
		_helo setvariable ["boatCoords", [0,0.8,-2.59], true];
		_helo setvariable ["push",TRUE, true];
		_helo setvariable ["ramp",["ramp_bottom", "ramp_top"], true];
		_helo setVariable ["recover", true, true];
		_helo setVariable ["jumpRotation", 180, true];
	};
	
	//RHS UH-60 Series ===========================
	case "RHS_UH60M";
	case "RHS_UH60M_d";
	case "RHS_UH60M_ESSS_d";
	case "RHS_UH60M_ESSS";
	case "RHS_UH60M_ESSS2_d";
	case "RHS_UH60M_ESSS2";
	case "RHS_UH60M2_d";
	case "RHS_UH60M2";
	case "RHS_UH60M_MEV2_d";
	case "RHS_UH60M_MEV_d";
	case "RHS_UH60M_MEV2";
	case "RHS_UH60M_MEV": 
	{
		_helo setvariable ["boatCoords", [0, 1.8, -1.45], true];
		_helo setvariable ["push",FALSE, true];
		_helo setvariable ["ramp",["DoorLB", "DoorRB"], true];
		_helo setVariable ["recover", false, true];
		_helo setVariable ["jumpRotation", -90, true];
		_helo setVariable ["altOffset", -1, true];
	};
	
	//CH-67 Series ===========================
	case"ej_MH67";
	case "B_Heli_Transport_03_F";
	case "B_Heli_Transport_03_unarmed_F";
	case "B_Heli_Transport_03_black_F";	
	case "B_Heli_Transport_03_unarmed_green_F ": 
	{
		_helo setvariable ["boatCoords", [0, -2.1, -0.6], true];
		_helo setvariable ["push",TRUE, true];
		_helo setvariable ["ramp",["Door_rear_source"], true];
		_helo setVariable ["recover", false, true];	//This SHOULD work but the -67s sink when they touch a boat...
		_helo setVariable ["jumpRotation", 180, true];
	};
	
	//CUP H-60 FFV ===========================
	case "CUP_B_UH60M_FFV_US";	
	case "CUP_B_UH60M_Unarmed_FFV_US";
	case "CUP_B_UH60M_Unarmed_FFV_MEV_US":
	{
		_helo setvariable ["boatCoords", [0,1.8,-0.67], true];
		_helo setvariable ["push",false, true];
		_helo setvariable ["ramp",[], true];
		_helo setVariable ["recover", false, true];
		_helo setVariable ["jumpRotation", -90, true];
		_helo setVariable ["altOffset", -1, true];
	};
	
	//CUP H-60 ===========================
	case "CUP_B_MH60L_DAP_2x_US";
	case "CUP_B_MH60L_DAP_4x_US";
	case "CUP_B_UH60M_US";
	case "CUP_B_UH60M_Unarmed_US";
	case "CUP_B_UH60S_USN";
	case "CUP_B_MH60L_DAP_2x_USN";
	case "CUP_B_MH60L_DAP_4x_USN":
	{
		_helo setvariable ["boatCoords", [0,1.8,-0.67], true];
		_helo setvariable ["push",false, true];
		_helo setvariable ["ramp",["Doors"], true];
		_helo setVariable ["recover", false, true];
		_helo setVariable ["jumpRotation", -90, true];
		_helo setVariable ["altOffset", -1, true];
	};
	
	//CUP MH-60S FFV ===========================
	case "CUP_B_MH60S_FFV_USMC":
	{
		_helo setvariable ["boatCoords", [0,1.8,-0.75], true];
		_helo setvariable ["push",false, true];
		_helo setvariable ["ramp",[], true];
		_helo setVariable ["recover", false, true];
		_helo setVariable ["jumpRotation", -90, true];
		_helo setVariable ["altOffset", -1, true];
	};
	
	//CUP MH-60S ===========================
	case "CUP_B_MH60S_USMC":
	{
		_helo setvariable ["boatCoords", [0,1.8,-0.75], true];
		_helo setvariable ["push",false, true];
		_helo setvariable ["ramp",["Doors"], true];
		_helo setVariable ["recover", false, true];
		_helo setVariable ["jumpRotation", -90, true];
		_helo setVariable ["altOffset", -1, true];
		
	};


	//CUP MH-47 ===========================
	case "CUP_B_MH47E_USA":
	{
		_helo setvariable ["boatCoords", [0,-3.5,2.1], true];
		_helo setvariable ["push",true, true];
		_helo setvariable ["ramp",["Ani_Ramp"], true];	
		_helo setVariable ["recover", true, true];
		_helo setVariable ["jumpRotation", 180, true];
		_helo setVariable ["altOffset", -4, true];
		_helo setVariable ["rampInvert", true, true];
	};


	//CUP CH-53 ===========================
	case "CUP_B_CH53E_USMC":
	{
		_helo setvariable ["boatCoords", [0,1,-2.82], true];
		_helo setvariable ["push",true, true];
		_helo setvariable ["ramp",["ramp_bottom","ramp_top"], true];
		_helo setVariable ["recover", true, true];
		_helo setVariable ["jumpRotation", 180, true];
	};

	//EricJ H-60s ===========================
	case "ej_MH60L";
	case "ej_MH60M";
	case "ej_UH60M_NATO";
	case "ej_UH60M_U";
	case "ej_UH60M_UT";
	case "ej_MH60SI2";
	case "ej_MH60SI";
	case "ej_MH60S":
	{
		_helo setvariable ["boatCoords", [0,1.62,-1.44], true];
		_helo setvariable ["push",false, true];
		_helo setvariable ["ramp",["RDoor","LDoor"], true];
		_helo setVariable ["jumpOffset",[0,-0.5,0], true];
		_helo setVariable ["recover", false, true];
		_helo setVariable ["jumpRotation", -90, true];
		_helo setVariable ["altOffset", -1.5, true];
	};
	
	//EricJ H-92s ===========================	
	case "ej_UH92";
	case "ej_UH92_NATO";
	case "ej_MH92":
	{
		_helo setvariable ["boatCoords", [0,2.2,-0.78], true];
		_helo setvariable ["push",false, true];
		_helo setvariable ["ramp",["RDoor","LDoor"], true];
		_helo setVariable ["recover", false, true];
		_helo setVariable ["jumpRotation", -90, true];
		_helo setVariable ["altOffset", -1.5, true];
	};
	
	//Konyo MH-47 Ramp ===========================	
	case "kyo_MH47E_Ramp":
	{
		_helo setvariable ["boatCoords", [0.1,-1.42,-0.48], true];
		_helo setvariable ["push",true, true];
		_helo setvariable ["ramp",[], true];
		_helo setVariable ["recover", true, true];
		_helo setVariable ["jumpRotation", 180, true];
		_helo setVariable ["altOffset", -1.5, true];
		_helo setVariable ["rampInvert", true, true];			
	};
	//Konyo MH-47 Ramp ===========================	
	case "kyo_MH47E_base":
	{
		_helo setvariable ["boatCoords", [0.1,-1.42,-0.48], true];
		_helo setvariable ["push",true, true];
		_helo setvariable ["ramp",["Ani_Ramp"], true];
		_helo setVariable ["recover", true, true];
		_helo setVariable ["jumpRotation", 180, true];
		_helo setVariable ["altOffset", -1.5, true];
		_helo setVariable ["rampInvert", true, true];	
		_helo setVariable ["jumpOffset", [0,-6,-1], true];			
	};

	//Konyo MH-47 HC ===========================
	case "kyo_MH47E_HC":
	{
		_helo setvariable ["boatCoords", [0.1,-1.46,-0.95], true];
		_helo setvariable ["push",true, true];
		_helo setvariable ["ramp",["Ani_Ramp"], true];
		_helo setVariable ["recover", true, true];
		_helo setVariable ["jumpRotation", 180, true];
		_helo setVariable ["altOffset", -1.5, true];
		_helo setVariable ["rampInvert", true, true];	
		_helo setVariable ["jumpOffset", [0,-5.3,-1.5], true];		
	};
	
	//CUP MV-22 ===========================
	case "CUP_B_MV22_USMC":
	{
		_helo setvariable ["boatCoords", [0,-1.1,-1.15], true];
		_helo setvariable ["push",true, true];
		_helo setvariable ["ramp",["Ramp_Top","Ramp_Bottom"], true];
		_helo setVariable ["recover", true, true];
		_helo setVariable ["jumpRotation", 180, true];		
	};
	
	//Vanilla Blackfish ===========================
	case "B_T_VTOL_01_infantry_F":
	{
		_helo setvariable ["boatCoords", [0,-1.27,-4.4], true];
		_helo setvariable ["push",true, true];
		_helo setvariable ["ramp",["Ramp_Top","Door_1_Source"], true];
		_helo setVariable ["recover", true, true];
		_helo setVariable ["jumpRotation", 180, true];
		_helo setVariable ["jumpOffset", [0,-7.5,-6], true];		
	};
	
	//OPTRE Pelicans ===========================
	case "OPTRE_Pelican_unarmed";
	case "OPTRE_Pelican_armed":
	{
		_helo setvariable ["boatCoords", [0,-4.4,1.3], true];
		_helo setvariable ["push",false, true];
		_helo setvariable ["ramp",["cargoDoor_1","cargoDoor_2"], true];
		_helo setVariable ["recover", true, true];
		_helo setVariable ["jumpRotation", 180, true];
		_helo setVariable ["jumpOffset", [0,2.5,2], true];		
	};

	default 
	{
		_kill=true;
	};		
};

if(_kill) exitWith
{
	diag_log format["---Helocast debug - Exited Helocast because of unsupported type: %1", typeof _helo];
};

//======== PREVENT HELOS FROM TAKING DAMAGE FROM BOATS ===============
_helo addEventHandler ["HandleDamage", {if ([_this select 3] call fatLurch_fnc_isBoat) then { 0; } else { _this select 2; };}];	

//===== CREATE ACTIONS ON HELO =====
//Updated code to use conditions to show/hide actions in lieu of adding/deleting them

//_target = _helo
//_this = calling player
[_helo, ["Prep for Helocast", "call fatlurch_fnc_prepHelocast",nil,10, false, false, "","(isNil {_target getVariable 'readyHelocast'})&&((getPosASL _target select 2) >0.5) && (isEngineOn _target) && (!isNil {_target getVariable 'boat'})"]] remoteExec ["addAction",0, true];
[_helo, ["Helocast", "call fatlurch_fnc_helocast",nil,10, false, false, "","(_target getVariable 'readyHelocast')&&((getPosASL _target select 2) >0.5) &&((getPosASL _target select 2) <4.5) && ((speed _target) <15) && isEngineOn _target && surfaceiswater position _target && (!isNil {_target getVariable 'boat'})"]] remoteExec ["addAction",0, true];
[_helo, ["Cancel Helocast", "call fatlurch_fnc_cancelHelocast",nil,0.1, false, false, "","_target getVariable 'readyHelocast'"]] remoteExec ["addAction",0, true];
[_helo, ["Secure CRRC", "call fatlurch_fnc_recoverCRRC",nil,10, false, false, "","[_target, _this] call fatLurch_fnc_canRecover;", 6]] remoteExec ["addAction",0, true];
//New 2019-12-26
[_helo, ["Load CRRC into Helo", "[_this select 0] call fatLurch_fnc_loadBoat;",nil,10, false, false, "","[_target] call fatLurch_fnc_loadableBoat select 0;", 8]] remoteExec ["addAction",0, true];
[_helo, ["Unload CRRC", "[_this select 0] call fatLurch_fnc_unloadBoat;",nil,10, false, false, "","[_target, _this] call fatLurch_fnc_canUnload;", 8]] remoteExec ["addAction",0, true];

//Add a CRRC if checked in the Eden attribute for the helo
_addBoat = _helo getVariable ["addBoat", false];

if(_addBoat) then 
{
	_boatType = _helo getVariable "boatType";
	[_helo, _boatType] call fatlurch_fnc_addCRRC;
};














