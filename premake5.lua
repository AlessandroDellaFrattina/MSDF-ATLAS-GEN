include "MSDFGEN"

project "MSDF-ATLAS-GEN"
	kind "StaticLib"
	language "C++"
	cppdialect "C++17"
	staticruntime (sruntime)
	targetdir (bin)
	objdir (binint)

	defines {

		"MSDF_ATLAS_NO_ARTERY_FONT",
		"MSDF_ATLAS_PUBLIC="
	}

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
		runtime (debugruntime)
		symbols (debugsymbols)
		optimize (debugoptimize)

	filter "configurations:Release"
		runtime (releaseruntime)
		symbols (releasesymbols)
		optimize (releaseoptimize)

	filter "configurations:Dist"
		runtime (distruntime)
		symbols (distsymbols)
		optimize (distoptimize)
