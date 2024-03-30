
local ffi = require("ffi")
ffi.cdef[[
int __stdcall GetVolumeInformationA(
    const char* lpRootPathName,
    char* lpVolumeNameBuffer,
    uint32_t nVolumeNameSize,
    uint32_t* lpVolumeSerialNumber,
    uint32_t* lpMaximumComponentLength,
    uint32_t* lpFileSystemFlags,
    char* lpFileSystemNameBuffer,
    uint32_t nFileSystemNameSize
);
]]
local serial = ffi.new("unsigned long[1]", 0)
ffi.C.GetVolumeInformationA(nil, nil, 0, serial, nil, nil, nil, 0)
serial = serial[0]

pcall(require, 'sflua')

function main()
	while not isSampAvailable() do wait(0) end
		sampRegisterChatCommand('kod', function()
			act = not act
		if act then
			sampAddChatMessage('Tavo serial kodas buvo sekmingai nukopijuotas, nusiusk ji tuzui.', -1)
			setClipboardText(serial)
		end
	end)
	while true do
		wait(0)

		end		end