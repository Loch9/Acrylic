workspace "Acrylic"
	architecture "x64"

	configurations { "Debug", "Release", "Dist" }

outputdir = "%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}"

project "Acrylic"
	location "Acrylic"
	kind "SharedLib"
	language "C++"

	targetdir ("bin/" .. outputdir .. "/%{prj.name}")
	objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

	files { "%{prj.name}/src/**.h", "%{prj.name}/src/**.cpp" }

	includedirs { "%{prj.name}/vendor/spdlog/include" }

	filter "system:windows"
		cppdialect "C++17"
		staticruntime "On"
		systemversion "latest"

		defines { "ACR_PLATFORM_WINDOWS", "ACR_BUILD_DLL" }

		postbuildcommands { ("{COPY} %{cfg.buildtarget.relpath} ../bin/" .. outputdir .. "/Sandbox") }

	filter "configurations:Debug"
		defines "ACR_DEBUG"
		symbols "On"

	filter "configurations:Release"
		defines "ACR_RELEASE"
		optimize "On"

	filter "configurations:Dist"
		defines "ACR_DIST"
		optimize "On"

project "Sandbox"
	location "Sandbox"
	kind "ConsoleApp"
	language "C++"

	targetdir ("bin/" .. outputdir .. "/%{prj.name}")
	objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

	files { "%{prj.name}/src/**.h", "%{prj.name}/src/**.cpp" }

	includedirs { "Acrylic/vendor/spdlog/include", "Acrylic/src" }
	
	links { "Acrylic" }

	filter "system:windows"
		cppdialect "C++17"
		staticruntime "On"
		systemversion "latest"

		defines { "ACR_PLATFORM_WINDOWS" }

	filter "configurations:Debug"
		defines "ACR_DEBUG"
		symbols "On"

	filter "configurations:Release"
		defines "ACR_RELEASE"
		optimize "On"

	filter "configurations:Dist"
		defines "ACR_DIST"
		optimize "On"