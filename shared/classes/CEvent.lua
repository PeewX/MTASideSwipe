CEvent = {}

function CEvent:constructor()

end

function CEvent:destructor()

end

function CEvent:add(Instance, str_Event, eAttachedTo, bool_addHandler)
	Instance[("_%s"):format(str_Event)] = bind(Instance[str_Event], Instance)
	
	if bool_addHandler then
		addEventHandler(str_Event, eAttachedTo, Instance[("_%s"):format(str_Event)])
	end
end

function CEvent:addRemote(Instance, str_Event, str_Function)
	Instance[("_%s"):format(str_Event)] = bind(Instance[str_Function or str_Event], Instance)
	RPC:registerFunction(str_Event, Instance[("_%s"):format(str_Event)])
end

function CEvent:remove(Instance, str_Event, eAttachedTo)
	if Instance[("_%s"):format(str_Event)] then
		addEventHandler(str_Event, eAttachedTo, Instance[("_%s"):format(str_Event)])
	end
end

function CEvent:removeRemote(Instance, str_Event)
	Instance[("_%s"):format(str_Event)] = nil
	RPC:unregisterFunction(str_Event)
end