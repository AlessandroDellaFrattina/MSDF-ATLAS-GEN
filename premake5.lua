include "MSDFGEN"

project "MSDF-ATLAS-GEN"
	kind "StaticLib"
	language "C++"
	cppdialect "C++17"
	staticruntime "On"

	targetdir ("%{wks.location}/bin/" .. outputdir .. "/%{prj.name}")
	objdir ("%{wks.location}/bin-int/" .. outputdir .. "/%{prj.name}")

	includedirs {

		"msdf-atlas-gen",
		"MSDFGEN",
		"MSDFGEN/include"
	}

	links {

		"MSDFGEN"
	}

	files {

		"msdf-atlas-gen/**.h",
		"msdf-atlas-gen/**.hpp",
		"msdf-atlas-gen/**.cpp"
	}

	disablewarnings "4267"

	filter "system:windows"	
		systemversion "latest"
		defines "_CRT_SECURE_NO_WARNINGS"

	filter "system:macosx"

		sysincludedirs {

			"msdf-atlas-gen",
			"MSDFGEN",
			"MSDFGEN/include"
		}

		externalincludedirs {

			"msdf-atlas-gen",
			"MSDFGEN",
			"MSDFGEN/include"
		}

	filter "configurations:Debug"
		defines "VE_DEBUG"
		runtime "Debug"
		symbols "On"

	filter "configurations:Release"
		defines "VE_RELEASE"
		runtime "Release"
		symbols "On"
		optimize "On"

	filter "configurations:Dist"
		defines "VE_DIST"
		runtime "Release"
		optimize "On"
