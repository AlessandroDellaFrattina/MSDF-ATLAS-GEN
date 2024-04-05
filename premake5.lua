include "MSDFGEN"

project "MSDF-ATLAS-GEN"
	kind "StaticLib"
	language "C++"
	cppdialect "C++17"
	staticruntime "Off"
	targetdir ("%{wks.location}/bin/" .. outputdir .. "/lib")
	objdir ("%{wks.location}/bin-int/" .. outputdir .. "/lib")

	includedirs {

		"msdf-atlas-gen",
		"MSDFGEN",
		"MSDFGEN/include"
	}

	links {

		"MSDFGEN"
	}

	defines {

		"MSDF_ATLAS_NO_ARTERY_FONT",
		"MSDF_ATLAS_PUBLIC="
	}

	files {

		"msdf-atlas-gen/**.h",
		"msdf-atlas-gen/**.hpp",
		"msdf-atlas-gen/**.cpp"
	}

	filter "system:windows"	
		systemversion "latest"
		defines "_CRT_SECURE_NO_WARNINGS"
		disablewarnings "4267"

	filter "system:macosx"

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
