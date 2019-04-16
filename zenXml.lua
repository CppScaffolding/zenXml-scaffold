-- scaffold geniefile for zenXml

zenXml_script = path.getabsolute(path.getdirectory(_SCRIPT))
zenXml_root = path.join(zenXml_script, "zenXml")

zenXml_includedirs = {
	path.join(zenXml_script, "config"),
	zenXml_root,
}

zenXml_libdirs = {}
zenXml_links = {}
zenXml_defines = {}

----
return {
	_add_includedirs = function()
		includedirs { zenXml_includedirs }
	end,

	_add_defines = function()
		defines { zenXml_defines }
	end,

	_add_libdirs = function()
		libdirs { zenXml_libdirs }
	end,

	_add_external_links = function()
		links { zenXml_links }
	end,

	_add_self_links = function()
		links { "zenXml" }
	end,

	_create_projects = function()

project "zenXml"
	kind "StaticLib"
	language "C++"
	flags {}

	includedirs {
		zenXml_includedirs,
	}

	defines {}

	files {
		path.join(zenXml_script, "config", "**.h"),
		path.join(zenXml_root, "**.h"),
		path.join(zenXml_root, "**.cpp"),
	}

end, -- _create_projects()
}

---
