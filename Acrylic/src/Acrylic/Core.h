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

#ifdef ACR_ENABLE_ASSERTS
	#define ACR_ASSERT(x, ...) { if(!(x)) { ACR_ERROR("Assertion Failed: {0}", __VA_ARGS__); __debugbreak(); } }
	#define ACR_CORE_ASSERT(x, ...) { if(!(x)) { ACR_CORE_ERROR("Assertion Failed: {0}", __VA_ARGS__); __debugbreak(); } }
#else
	#define ACR_ASSERT(x, ...)
	#define ACR_CORE_ASSERT(x, ...)
#endif

#define BIT(x) (1 << x)

#define ACR_BIND_EVENT_FN(fn) std::bind(&fn, this, std::placeholders::_1)