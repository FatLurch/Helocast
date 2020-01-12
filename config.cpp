//Last edit: 2020-01-05

#include "dialogs\loadBoat.h"
#include "dialogs\unloadBoat.h"

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
 
 class CfgVehicles 
 {
 	class Man;
 	class CAMANBase: Man
 	{
 		impactEffectSpeedLimit = 6;
 	};
 	
 	class Ship;
 	class Rubber_Duck_Base_F: Ship
 	{
 		impactEffectSpeedLimit = 7;
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
			class testBoat
			{
				file = "Helocast\functions\testBoat.sqf";
			};
			class rampDoor
			{
				file = "Helocast\functions\rampDoor.sqf";
			};
			class nonFlightCrew
			{
				file = "Helocast\functions\nonFlightCrew.sqf";
			};
			class groupNonFlightCrew
			{
				file = "Helocast\functions\groupNonFlightCrew.sqf";
			};
			class addMarker
			{
				file = "Helocast\functions\addMarker.sqf";
			};
			class ejectBoat
			{
				file = "Helocast\functions\ejectBoat.sqf";
			};
			class moveBoat
			{
				file = "Helocast\functions\moveBoat.sqf";
			};
			class boatIndex
			{
				file = "Helocast\functions\boatIndex.sqf";
			};
			class defaultJumpPlan
			{
				file = "Helocast\functions\defaultJumpPlan.sqf";
			};	
			class loadDialog
			{
				file = "Helocast\functions\loadDialog.sqf";
			};	
			class unloadDialog
			{
				file = "Helocast\functions\unloadDialog.sqf";
			};
			class countBoats
			{
				file = "Helocast\functions\countBoats.sqf";
			};
			class reattachRHS
			{
				file = "Helocast\functions\reattachRHS.sqf";
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
					class addCRRC
					{
						//--- Mandatory properties
						displayName = "Add CRRC"; // Name assigned to UI control class Title
						tooltip = "Adds a CRRC (If Supported)"; // Tooltip assigned to UI control class Title
						property = "addCRRC"; // Unique config property name saved in SQM
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
					
					class boatType
					{
						//--- Mandatory properties
						displayName = "Select CRRC Type"; // Name assigned to UI control class Title
						tooltip = ""; // Tooltip assigned to UI control class Title
						property = "typeCRRC"; // Unique config property name saved in SQM
						control = "Combo"; // UI control base class displayed in Edit Attributes window, points to Cfg3DEN >> Attributes

						// Expression called when applying the attribute in Eden and at the scenario start
						// The expression is called twice - first for data validation, and second for actual saving
						// Entity is passed as _this, value is passed as _value
						// %s is replaced by attribute config name. It can be used only once in the expression
						// In MP scenario, the expression is called only on server.
						expression = "_this setVariable ['%s',_value];";
						//TODO expression = "if(_value) then {_this setVariable ['addBoat', true, true];};";	//_value is the boolean checkbox in Eden. _this is the target vehicle in Eden

						// Expression called when custom property is undefined yet (i.e., when setting the attribute for the first time)
						// Entity (unit, group, marker, comment etc.) is passed as _this
						// Returned value is the default value
						// Used when no value is returned, or when it's of other type than NUMBER, STRING or ARRAY
						// Custom attributes of logic entities (e.g., modules) are saved always, even when they have default value
						defaultValue = "B_Boat_Transport_01_F";

						//--- Optional properties
						unique = 0; // When 1, only one entity of the type can have the value in the mission (used for example for variable names or player control)
						//validate = "number"; // Validate the value before saving. Can be "none", "expression", "condition", "number" or "variable"
						condition = "objectVehicle"; // Condition for attribute to appear (see the table below)
						typeName = "STRING"; // Defines data type of saved value, can be STRING, NUMBER or BOOL. Used only when control is "Combo", "Edit" or their variants
						class Values 
						{
							class boat0
							{
								name = "Assault Boat (FIA)"
								value = "B_G_Boat_Transport_01_F"
							};
							
							class boat1
							{							
								name = "Assault Boat (NATO)"
								value = "B_Boat_Transport_01_F"
							};
							
							class boat2
							{				
								name = "Rescue Boat (NATO)"
								value = "B_Lifeboat"
							};
							
							class boat3
							{							
								name = "Assault Boat (Pacific NATO)"
								value = "B_T_Boat_Transport_01_F"
							};
							
							class boat4
							{
								name = "Rescue Boat (Pacific NATO)"
								value = "B_T_Lifeboat"
							};
							
							class boat5
							{
								name = "Assault Boat (Iranian CSAT)"
								value = "O_Boat_Transport_01_F"
							};
							
							class boat6
							{
								name = "Rescue Boat (Iranian CSAT)"
								value = "O_Lifeboat"
							};

							class boat7
							{
								name = "Assault Boat (Chinese CSAT)"
								value = "O_T_Boat_Transport_01_F"
							};
							
							class boat8
							{
								name = "Rescue Boat (Chinese CSAT)"
								value = "O_T_Lifeboat"
							};
							
							class boat9
							{
								name = "Assault Boat (FIA)"
								value = "O_G_Boat_Transport_01_F"
							};
							
							class boat10
							{
								name = "Assault Boat (AAF)"
								value = "I_Boat_Transport_01_F"
							};
							
							class boat11
							{
								name = "Assault Boat (FIA)"
								value = "I_G_Boat_Transport_01_F"
							};
							
							class boat12
							{
								name = "Assault Boat (Syndikat)"
								value = "I_C_Boat_Transport_01_F"
							};
							
							class boat13
							{
								name = "Rescue Boat (Civilian)"
								value = "C_Rubberboat"
							};
														
							class boat14
							{
								name = "Zodiac CRRC"
								value = "ZodiacCRRCboat"
							};					
						};
					};	
					
					class boatCount
					{
						displayName = "Select Number of CRRCs"; // Name assigned to UI control class Title
						tooltip = ""; // Tooltip assigned to UI control class Title
						property = "boatCount"; // Unique config property name saved in SQM
						control = "Combo"; // UI control base class displayed in Edit Attributes window, points to Cfg3DEN >> Attributes
						expression = "_this setVariable ['%s',_value];";
						defaultValue = "1";
						unique = 0; // When 1, only one entity of the type can have the value in the mission (used for example for variable names or player control)
						condition = "objectVehicle"; // Condition for attribute to appear (see the table below)
						typeName = "NUMBER"; // Defines data type of saved value, can be STRING, NUMBER or BOOL. Used only when control is "Combo", "Edit" or their variants
						class Values 
						{
							
							class value1
							{							
								name = "1"
								value = 1
							};
							
							class value2
							{				
								name = "2"
								value = 2
							};	
						};				
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
	            //init = "(_this select 0) spawn fatLurch_fnc_setupHelocast; (_this select 0) spawn fatLurch_fnc_reattachRHS;";
	            init = "(_this select 0) spawn fatLurch_fnc_setupHelocast; rhsArray=['RHS_CH_47F_10','RHS_CH_47F_light','RHS_CH_47F','rhsusf_CH53E_USMC','rhsusf_CH53E_USMC_D'];if((typeOf (_this select 0) in rhsArray)) then {[_this select 0] spawn fatLurch_fnc_reattachRHS};";
	        };
   	 };
	class Plane:air 
	{
        	class Fat_Lurch_Helocast_eh
		{
	            init = "(_this select 0) spawn fatLurch_fnc_setupHelocast;";
	        };
   	 };
   	 class Boat_F;
   	 class Rubber_duck_base_F:Boat_F
   	 {
   	 	class Fat_Lurch_Helocast_eh
		{
	            init = "(_this select 0) spawn fatLurch_fnc_setupBoat";
	        };
   	 };	
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


