///@self
///@description										Detect inputs from playerInfo.playerInputs (objControllers)
///@param {_struct} _struct							The struct to check vallues for
function detectInput(_struct)
{
    var keys = variable_struct_get_names(_struct);

    for (var i = 0; i < array_length(keys); i++)
    {
        var keyState = variable_struct_get(_struct, keys[i]);
		var val = variable_struct_get_names(keyState)
		
		for(var j = 0; j < array_length(val); j++)
		{
			if keyState[$ val[j]]
			{
				return true;
			}
		}
    }

    return false;
}

///@self
///@description										Detect inputs from playerInfo.playerInputs (objControllers)
///@param {_struct} _struct							The struct to check vallues for
function detectGuessInput(_inputsStruct, _inputsRef, _guessInputsRef)
{	
	var guessInputs = struct_get_names(_guessInputsRef)
	
	for(var i = 0; i < array_length(guessInputs); i++)
	{
		var keyState = _inputsStruct[$ _inputsRef[$ guessInputs[i]]]
		var keyStateNames = struct_get_names(keyState)
		
		for(var j = 0; j < array_length(keyStateNames); j++)
		{
			if keyState[$ keyStateNames[j]]
			{
				return true;
			}
		}
	}
	
	return false;
	
}

///@self
///@description										Get the inputs used from playerInfo.playerInputs (objControllers)
///@param {_struct} _struct							The struct to check values for
function getInputs(_struct)
{
	var inputsArray = [];
    var keys = variable_struct_get_names(_struct);

    for (var i = 0; i < array_length(keys); i++)
    {
        var keyState = variable_struct_get(_struct, keys[i]);
		var val = variable_struct_get_names(keyState)
		
		for(var j = 0; j < array_length(val); j++)
		{
			if keyState[$ val[j]]
			{
				array_push(inputsArray, keys[i]);
			}
		}
    }

    return inputsArray;
}

///@self	
///@description  									Struct of playerInfo (objControllers)
///@param {real} _id								ID of the controller to add to the players struct
///@param {string} _type							Type of the controller to add to the players struct
///@param {struct} _playerInputs					Struct containing the buttons expected of the controller, and whether they are held, pressed, released as booleans
function playerInfo(_id, _type, _inputsRef, _playerName, _playerInputs = {}) constructor {
    controllerId = _id;
	controllerType = _type;
	inputsRef = variable_clone(_inputsRef);
    playerInputs = _playerInputs;
	playerName = _playerName
}