#include <Acrylic.h>

class ExampleLayer : public Acrylic::Layer
{
public:
	ExampleLayer()
		: Layer("Example")
	{
	}

	void OnUpdate() override
	{
		ACR_INFO("ExampleLayer::Update");
	}

	void OnEvent(Acrylic::Event& event) override
	{
		ACR_TRACE("{0}", event);
	}

};

class Sandbox : public Acrylic::Application
{
public:
	Sandbox()
	{
		PushLayer(new ExampleLayer());
		PushOverlay(new Acrylic::ImGuiLayer());
	}

	~Sandbox()
	{

	}

};

Acrylic::Application* Acrylic::CreateApplication()
{
	return new Sandbox();
}