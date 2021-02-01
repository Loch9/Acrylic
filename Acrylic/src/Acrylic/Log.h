#pragma once

#include "Core.h"
#include "spdlog/spdlog.h"
#include "spdlog/fmt/ostr.h"

namespace Acrylic {

	class ACRYLIC_API Log
	{
	public:
		static void Init();

		inline static std::shared_ptr<spdlog::logger>& GetCoreLogger() { return s_CoreLogger; }
		inline static std::shared_ptr<spdlog::logger>& GetClientLogger() { return s_ClientLogger; }
	private:
		static std::shared_ptr<spdlog::logger> s_CoreLogger;
		static std::shared_ptr<spdlog::logger> s_ClientLogger;
	};

}

#define ACR_CORE_TRACE(...)    ::Acrylic::Log::GetCoreLogger()->trace(__VA_ARGS__)
#define ACR_CORE_INFO(...)     ::Acrylic::Log::GetCoreLogger()->info(__VA_ARGS__)
#define ACR_CORE_WARN(...)     ::Acrylic::Log::GetCoreLogger()->warn(__VA_ARGS__)
#define ACR_CORE_ERROR(...)    ::Acrylic::Log::GetCoreLogger()->error(__VA_ARGS__)
#define ACR_CORE_CRITICAL(...) ::Acrylic::Log::GetCoreLogger()->critical(__VA_ARGS__)

#define ACR_TRACE(...)	       ::Acrylic::Log::GetClientLogger()->trace(__VA_ARGS__)
#define ACR_INFO(...)	       ::Acrylic::Log::GetClientLogger()->info(__VA_ARGS__)
#define ACR_WARN(...)	       ::Acrylic::Log::GetClientLogger()->warn(__VA_ARGS__)
#define ACR_ERROR(...)	       ::Acrylic::Log::GetClientLogger()->error(__VA_ARGS__)
#define ACR_CRITICAL(...)	   ::Acrylic::Log::GetClientLogger()->critical(__VA_ARGS__)