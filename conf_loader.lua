local ngx_log = ngx.log
local ERR = ngx.ERR
local DEBUG = ngx.DEBUG

local _M = { _VERSION = '0.0.1' }

-- sentinel列表
_M.sentinel_list = {
	{ "127.0.0.1", 6403 },
	{ "127.0.0.1", 6404 },
	{ "127.0.0.1", 6405 }
}

-- sentinel监控的masterName列表
_M.sentinel_master_name_list = {
	"sentinel-10.237.40.208-6401"
}

return _M


-- 加载配置
--[[
local pl_path = require "pl.path"
local pl_file = require "pl.file"
local pl_stringio = require "pl.stringio"
local pl_config = require "pl.config"

local DEFAULT_PATHS = {
  "/etc/nedis.conf"
}

function _M.load(path, custom_conf)
	if path and pl_path.exists(path) then
		return nil, "not file at:"..path
	end

	local f, err = pl_file.read(path)
	if not f then return nil, err end
	ngx_log(DEBUG,"reading config file at ",path)
	local from_file_conf = {}

    local s = pl_stringio.open(f)
    from_file_conf, err = pl_config.read(s, {
      smart = false,
      list_delim = "_blank_" -- mandatory but we want to ignore it
    })
    s:close()
    if not from_file_conf then return nil, err end
    return from_file_conf
end
]]--
