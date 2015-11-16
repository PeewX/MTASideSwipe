CSingleton = {}

function CSingleton:getSingleton(...)
    if not self.ms_Instance then
        self.ms_Instance = self:new(...)
    end
    return self.ms_Instance
end

function CSingleton:new(...)
    self.new = function() end
    local inst = new(self, ...)
    self.ms_Instance = inst
    return inst
end

function CSingleton:isInstantiated()
    return self.ms_Instance ~= nil
end

function CSingleton:virtual_destructor()
    for k, v in pairs(super(self)) do
        v.ms_Instance = nil
        v.new = Singleton.new
    end
end

--[[CSingleton = {}
CSingleton.__singletonObjects = {}

function CSingleton:derived_constructor()
    self:init()
end

function CSingleton:init() end

function CSingleton:getInstance(...)
    if not(self.__singletonObjects[self]) then
        outputConsole("Singleton not availabe, creating "..tostring(self))
        return self:new(...)
    end
    return self.__singletonObjects[self]
end

function CSingleton:isInitialized()
    return self.__singletonObjects[self] ~= nil
end

function CSingleton:new(...)
    if (self.__singletonObjects[self]) then
        self.__singletonObjects[self] = delete(self)
        self.__singletonObjects[self] = nil
    end
    local obj = {...}
    self.__singletonObjects[self] = new(self, ...)
    return self.__singletonObjects[self]
end]]