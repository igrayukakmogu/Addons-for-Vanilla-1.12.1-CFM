module 'aux.util.persistence'

include 'aux'

local T = require 'T'

function M.read(schema, str)
    if schema == 'string' then
        return str
    elseif schema == 'boolean' then
        return str == '1'
    elseif schema == 'number' then
        return tonumber(str)
    elseif type(schema) == 'table' and schema[1] == 'list' then
        return T.temp-read_list(schema, str)
    elseif type(schema) == 'table' and schema[1] == 'tuple' then
        return T.temp-read_tuple(schema, str)
    else
        error(INVALID_SCHEMA, 2)  --by Lichery
    end
end

function M.write(schema, obj)
    if schema == 'string' then
        return obj or ''
    elseif schema == 'boolean' then
        return obj and '1' or '0'
    elseif schema == 'number' then
        return obj and tostring(obj) or ''
    elseif type(schema) == 'table' and schema[1] == 'list' then
        return write_list(schema, obj)
    elseif type(schema) == 'table' and schema[1] == 'tuple' then
        return write_tuple(schema, obj)
    else
        error(INVALID_SCHEMA, 2)  --by Lichery
    end
end

function read_list(schema, str)
    if str == '' then return T.acquire() end
    local separator = schema[2]
    local element_type = schema[3]
    return map(split(str, separator), function(part)
        return read(element_type, part)
    end)
end

function write_list(schema, list)
    local separator = schema[2]
    local element_type = schema[3]
    local parts = map(T.temp-copy(list), function(element)
        return write(element_type, element)
    end)
    return join(parts, separator)
end

function read_tuple(schema, str)
    local separator = schema[2]
    local tuple = T.acquire()
    local parts = T.temp-split(str, separator)
    for i = 3, getn(schema) do
        local key, type = next(schema[i])
        tuple[key] = read(type, parts[i - 2])
    end
    return tuple
end

function write_tuple(schema, tuple)
    local separator = schema[2]
    local parts = T.temp-T.acquire()
    for i = 3, getn(schema) do
        local key, type = next(schema[i])
        tinsert(parts, write(type, tuple[key]))
    end
    return join(parts, separator)
end