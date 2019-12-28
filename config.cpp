//Last edit: 2019-12-26

class CfgPatches
 {
 	class Helocast_Addon
 	{
 		units[] = {"myTag_ModuleNuke"};
 		weapons[] = {};
 		requiredVersion = 0.1;
 		requiredAddons[] = {"A3_Functions_F", "A3_Characters_F"};
		version="0.1";
		author="Fat_Lurch";
 	};
 };
 
 class CfgFunctions
{
	class fatLurch
	{
		class Lurch_FunctionsHelocast
		{
			class setupHelocast
			{
				//fatlurch_fnc_setupHelocast
				file = "Helocast\functions\setupHelocast.sqf";
			};
			class prepHelocast
			{
				file = "Helocast\functions\prepHelocast.sqf";
			};
			class helocast
			{
				file = "Helocast\functions\helocast.sqf";
			};
			class cancelHelocast
			{
				file = "Helocast\functions\cancelHelocast.sqf";
			};
			class recoverCRRC
			{
				file = "Helocast\functions\recoverCRRC.sqf";
			};
			class addCRRC
			{
				file = "Helocast\functions\addCRRC.sqf";
			};
			class canRecover
			{
				file = "Helocast\functions\canRecover.sqf";
			};
			class setupBoat
			{
				file = "Helocast\functions\setupBoat.sqf";
			};
			class removeMarker
			{
				file = "Helocast\functions\removeMarker.sqf";
			};
			class isBoat
			{
				file = "Helocast\functions\isBoat.sqf";
			};
			class loadableBoat
			{
				file = "Helocast\functions\loadableBoat.sqf";
			};
			class loadBoat
			{
				file = "Helocast\functions\loadBoat.sqf";
			};
			class unloadBoat
			{
				file = "Helocast\functions\unloadBoat.sqf";
			};
			class canUnload
			{
				file = "Helocast\functions\canUnload.sqf";
			};
			class lightOn
			{
				file = "Helocast\functions\lightOn.sqf";
			};
			class lightOff
			{
				file = "Helocast\functions\lightOff.sqf";
			};
			class eject
			{
				file = "Helocast\functions\eject.sqf";
			};
		};
	};
};


class Cfg3DEN
{
	// Configuration of all objects
	class Object
	{
		// Categories collapsible in "Edit Attributes" window
		class AttributeCategories
		{
			// Category class, can be anything
			class MyCategory
			{
				displayName = "Helocast"; // Category name visible in Edit Attributes window
				collapsed = 1; // When 1, the category is collapsed by default
				class Attributes
				{
					// Attribute class, can be anything
					class MyAttribute
					{
						//--- Mandatory properties
						displayName = "Add CRRC"; // Name assigned to UI control class Title
						tooltip = "Adds a CRRC (If Supported)"; // Tooltip assigned to UI control class Title
						property = "MyAttributeUniqueID"; // Unique config property name saved in SQM
						control = "Checkbox"; // UI control base class displayed in Edit Attributes window, points to Cfg3DEN >> Attributes

						// Expression called when applying the attribute in Eden and at the scenario start
						// The expression is called twice - first for data validation, and second for actual saving
						// Entity is passed as _this, value is passed as _value
						// %s is replaced by attribute config name. It can be used only once in the expression
						// In MP scenario, the expression is called only on server.
						//expression = "_this setVariable ['%s',_value];";
						expression = "if(_value) then {_this setVariable ['addBoat', true, true];};";	//_value is the boolean checkbox in Eden. _this is the target vehicle in Eden

						// Expression called when custom property is undefined yet (i.e., when setting the attribute for the first time)
						// Entity (unit, group, marker, comment etc.) is passed as _this
						// Returned value is the default value
						// Used when no value is returned, or when it's of other type than NUMBER, STRING or ARRAY
						// Custom attributes of logic entities (e.g., modules) are saved always, even when they have default value
						defaultValue = "FALSE";

						//--- Optional properties
						unique = 0; // When 1, only one entity of the type can have the value in the mission (used for example for variable names or player control)
						//validate = "number"; // Validate the value before saving. Can be "none", "expression", "condition", "number" or "variable"
						condition = "objectVehicle"; // Condition for attribute to appear (see the table below)
						typeName = "BOOL"; // Defines data type of saved value, can be STRING, NUMBER or BOOL. Used only when control is "Combo", "Edit" or their variants
					};
				};
			};
		};
	};
};


class Extended_Init_EventHandlers 
{
	class air;
	class Helicopter:air 
	{
        	class Fat_Lurch_Helocast_eh
		{
	            init = "(_this select 0) spawn fatLurch_fnc_setupHelocast";
	        };
   	 };
   	 class Boat_F;
   	 class Rubber_duck_base_F:Boat_F
   	 {
   	 	class Fat_Lurch_Helocast_eh
		{
	            init = "(_this select 0) spawn fatLurch_fnc_setupBoat";
	        };
   	 }
   	 
	
};

class Extended_Killed_EventHandlers 
{
   	 class Boat_F;
   	 class Rubber_duck_base_F:Boat_F
   	 {
   	 	class Fat_Lurch_Helocast_eh
		{
	            killed = "(_this) spawn fatlurch_fnc_removeMarker";
	        };
   	 }	
};


