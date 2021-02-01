workspace "Acrylic"
	architecture "x64"

	configurations { "Debug", "Release", "Dist" }

outputdir = "%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}"

IncludeDir = {}
IncludeDir["GLFW"] = "Acrylic/vendor/GLFW/include"
IncludeDir["Glad"] = "Acrylic/vendor/Glad/include"
IncludeDir["ImGui"] = "Acrylic/vendor/imgui"

include "Acrylic/vendor/GLFW"
include "Acrylic/vendor/Glad"
include "Acrylic/vendor/imgui"

project "Acrylic"
	location "Acrylic"
	kind "SharedLib"
	language "C++"

	targetdir ("bin/" .. outputdir .. "/%{prj.name}")
	objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

	pchheader "acrpch.h"
	pchsource "Acrylic/src/acrpch.cpp"

	files { "%{prj.name}/src/**.h", "%{prj.name}/src/**.cpp" }

	includedirs { "%{prj.name}/vendor/spdlog/include", "%{prj.name}/src", "%{IncludeDir.GLFW}", "%{IncludeDir.Glad}", "%{IncludeDir.ImGui}" }

	links { "GLFW", "Glad", "ImGui", "opengl32.lib" }

	filter "system:windows"
		cppdialect "C++17"
		staticruntime "On"
		systemversion "latest"

		defines { "ACR_PLATFORM_WINDOWS", "ACR_BUILD_DLL", "GLFW_INCLUDE_NONE" }

		postbuildcommands { ("{COPY} %{cfg.buildtarget.relpath} ../bin/" .. outputdir .. "/Sandbox") }

	filter "configurations:Debug"
		defines { "ACR_DEBUG", "ACR_ENABLE_ASSERTS" }
		buildoptions "/MDd"
		symbols "On"

	filter "configurations:Release"
		defines "ACR_RELEASE"
		buildoptions "/MD"
		optimize "On"

	filter "configurations:Dist"
		defines "ACR_DIST"
		buildoptions "/MD"
		optimize "On"

project "Sandbox"
	location "Sandbox"
	kind "ConsoleApp"
	language "C++"

	targetdir ("bin/" .. outputdir .. "/%{prj.name}")
	objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

	files { "%{prj.name}/src/**.h", "%{prj.name}/src/**.cpp" }

	includedirs { "Acrylic/vendor/spdlog/include", "Acrylic/src", "Acrylic/vendor/Glad/include" }
	
	links { "Acrylic" }

	filter "system:windows"
		cppdialect "C++17"
		staticruntime "On"
		systemversion "latest"

		defines { "ACR_PLATFORM_WINDOWS" }

	filter "configurations:Debug"
		defines "ACR_DEBUG"
		buildoptions "/MDd"
		symbols "On"

	filter "configurations:Release"
		defines "ACR_RELEASE"
		buildoptions "/MD"
		optimize "On"

	filter "configurations:Dist"
		defines "ACR_DIST"
		buildoptions "/MD"
		optimize "On"