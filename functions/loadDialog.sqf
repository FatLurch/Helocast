params["_helo"];
_boats=[_helo] call fatLurch_fnc_loadableBoat select 1;
_boatCoords = _helo getVariable "boatCoords";
_boatArray = _helo getVariable["boatArray", [nil, nil]];

//Control reference
//200 - boat
//201 - position index
//202 - helo

createDialog "loadBoat";

//HELO
ctrlSetText [202, _helo call BIS_fnc_netId];	//send a reference for the helo to the dialog in a hidden control

//BOAT
//load with list of nearby suitable boats
//Boat Description - Boat Name (Blank by default) - Range in x.x meters
//e.g.: Assault Boat - Boaty - 5.1m
{
	//Buiild fancy name for dialog 
	 _vehName = _x getVariable ["hcname", ""];
	 _text = getText(configFile >> "CfgVehicles" >> typeOf _x >> "displayName");
	 _distance = format[" - %1m", (_helo distance2D _x toFixed 1)];
	_name="";
	 if(_vehName != "") then {_name = format[" - %1", _vehName];};
	 _indexRef=lbAdd[200, _text +_name+_distance];
	 
	//Add VALUES to the dialog in the background
	lbSetData [200, _indexRef, _x call BIS_fnc_netId];

	diag_log text format["************ Boat _x var: %1", _x];
}forEach _boats;

if(count _boatCoords ==1) then
{
	//single plosition helo
	_index1=lbAdd[201, "Center"];
	lbSetData [201, _index1, "0"];
}
else
{
	//2 position helo
	
	if(isNil{_boatArray select 0;}) then
	{
		//Forward position is free
		_index1=lbAdd[201, "Forward"];
		lbSetData [201, _index1, "0"];
	};
	
	if(isNil{_boatArray select 1;}) then
	{
		//Aft position is free
		_index1=lbAdd[201, "Aft"];
		lbSetData [201, _index1, "1"];
	};
};

