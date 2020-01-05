params["_helo"];
_boatArray = _helo getVariable["boatArray", [nil, nil]];

//Control reference
//200 - boat
//201 - position around aircraft
//202 - helo

createDialog "UnloadBoat";

//HELO
ctrlSetText [202, _helo call BIS_fnc_netId];	//send a reference for the helo to the dialog in a hidden control

//BOAT
//load with list of nearby suitable boats
//Boat Description - Boat Name (Blank by default)
{
	//Buiild fancy name for dialog 
	if(!isNil{_x}) then {
	_vehName = _x getVariable ["hcname", ""]; 
	 _text = getText(configFile >> "CfgVehicles" >> typeOf _x >> "displayName");
	_name="";
	 if(_vehName != "") then {_name = format[" - %1", _vehName];};
	 _indexRef=lbAdd[200, _text +_name];
	 
	//Add VALUES to the dialog in the background
	lbSetData [200, _indexRef, _x call BIS_fnc_netId];
	};
	
}forEach _boatArray;


_index1=lbAdd[201, "Left"];
lbSetData [201, _index1, "[6, -120]"];

_index2=lbAdd[201, "Behind"];
lbSetData [201, _index2, "[9.5, -180]"];

_index3=lbAdd[201, "Right"];
lbSetData [201, _index3, "[6, 120]"];



