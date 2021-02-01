#pragma once

#ifdef ACR_PLATFORM_WINDOWS

extern Acrylic::Application* Acrylic::CreateApplication();

int main(int argc, char** argv)
{
	Acrylic::Log::Init();
	ACR_CORE_ERROR("Log Initialized!");
	int a = 76;
	ACR_INFO("Hello! Var={0}", a);

	auto app = Acrylic::CreateApplication();
	app->Run();
	delete app;
}

#endif
