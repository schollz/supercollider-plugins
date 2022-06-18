

function os_capture(cmd, raw)
  local f = assert(io.popen(cmd, 'r'))
  local s = assert(f:read('*a'))
  f:close()
  if raw then return s end
  s = string.gsub(s, '^%s+', '')
  s = string.gsub(s, '%s+$', '')
  s = string.gsub(s, '[\n\r]+', ' ')
  return s
end

function split_path(path)
  -- https://stackoverflow.com/questions/5243179/what-is-the-neatest-way-to-split-out-a-path-name-into-its-components-in-lua
  -- /home/zns/1.txt returns
  -- /home/zns/   1.txt   txt
  pathname,filename,ext=string.match(path,"(.-)([^\\/]-%.?([^%.\\/]*))$")
  return pathname,filename,ext
end

function list_folders(directory)
  local i, t, popen = 0, {}, io.popen
  local pfile = popen('ls -pL --group-directories-first "'..directory..'"')
  for filename in pfile:lines() do
    i = i + 1
    t[i] = filename
  end
  pfile:close()
  return t
end

function reinstall()
	os.execute("rm -rf /home/we/.local/share/SuperCollider/Extensions/supercollider-plugins")
end

function install()
	local installed_files=os_capture("find /home/we/.local/share/SuperCollider/Extensions -name '*.sc'")
	os.execute("mkdir -p /home/we/.local/share/SuperCollider/Extensions/supercollider-plugins")
	for _, folder in ipairs(list_folders("/home/we/dust/code/supercollider-plugins/supercollider-plugins")) do
		local one_file=os_capture("find /home/we/dust/code/supercollider-plugins/supercollider-plugins/"..folder.." -name '*.sc' | head -n1")
		pathname,filename,ext=split_path(one_file)
		-- check if file exists
		if string.find(installed_files,filename) then 
			print("already have "..folder.." not installing.")
		else
			print("missing "..folder..", installing now.")			
			os.execute("cp -r /home/we/dust/code/supercollider-plugins/supercollider-plugins/"..folder.." /home/we/.local/share/SuperCollider/Extensions/supercollider-plugins/")
		end
	end
end


install()