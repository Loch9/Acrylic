#pragma once

#ifdef ACR_PLATFORM_WINDOWS
	#ifdef ACR_BUILD_DLL
		#define ACRYLIC_API __declspec(dllexport)
	#else
		#define ACRYLIC_API __declspec(dllimport)
	#endif
#else
	#error Acrylic only supports Windows!
#endif