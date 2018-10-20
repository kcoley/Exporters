-- Create Babylon light attributes
CAT_DEF = attributes Babylon_Attributes 
version:0
(
	Parameters main rollout:params
	(
		'babylonLight' Type:#BOOLEAN UI:'babylonLight' Default:True
	)
	Rollout Params "Babylon Attributes"
	(
		checkbox 'babylonLight' "Export Light" Width:70 Height:15 Align:#Left Offset:[0,0] Type:#BOOLEAN
	)
)


-- Add Babylon Attributes to all light used in the scene
for lux in lights do
(
	defs = custAttributes.getDefs lux;
	if defs != undefined then
	(
		--Check if babylon light attributes are present
		alreadyAdded = false;
		for def in defs do
		(
			if def.name == #Babylon_Attributes then
			(
				alreadyAdded = true;
			)
		)
		
		-- Add babylon light attributes if not present
		if alreadyAdded == false then
		(
			CustAttributes.add lux CAT_DEF;
		)
	)
    else (
        CustAttributes.add lux CAT_DEF;
    )
)