project "glfw"
	kind "StaticLib"
	language "C"

	targetdir ("%{wks.location}/bin/" .. outputdir .. "/%{prj.name}")
	objdir ("%{wks.location}/bin-int/" .. outputdir .. "/%{prj.name}")

	files
	{
		"include/GLFW/glfw3.h",
		"include/GLFW/glfw3native.h",
		"src/internal.h",
		"src/platform.h",
		"src/mappings.h",
		"src/null_platform.h",
		"src/null_joystick.h",
		"src/null_init.c",
		"src/null_monitor.c",
		"src/null_window.c",
		"src/null_joystick.c",
		"src/context.c",
		"src/init.c",
		"src/input.c",
		"src/monitor.c",
		"src/platform.c",
		"src/vulkan.c",
		"src/window.c",
		"src/egl_context.c",
		"src/osmesa_context.c"
	}

	filter "system:windows"
		systemversion "latest"

		files
		{
			"src/win32_init.c",
			"src/win32_joystick.h",
			"src/win32_joystick.c",
			"src/win32_module.c",
			"src/win32_monitor.c",
			"src/win32_platform.h",
			"src/win32_thread.c",
			"src/win32_time.c",
			"src/win32_window.c",
			"src/wgl_context.c"
		}

		defines 
		{ 
			"_GLFW_WIN32",
			"_CRT_SECURE_NO_WARNINGS"
		}

		links
		{
			"gdi32"
		}

	filter "system:macosx"
		pic "On"

		files
		{
			"src/cocoa_init.m",
			"src/cocoa_joystick.h",
			"src/cocoa_joystick.m",
			"src/cocoa_monitor.m",
			"src/cocoa_platform.h",
			"src/cocoa_time.h",
			"src/cocoa_time.c",
			"src/cocoa_window.m",
			"src/posix_module.c",
			"src/posix_thread.h",
			"src/posix_thread.c",
			"src/nsgl_context.m"
		}

		defines
		{
			"_GLFW_COCOA"
		}

		links
		{
			"Cocoa.framework",
			"CoreFoundation.framework",
			"IOKit.framework"
		}

	filter "system:linux"
		systemversion "latest"
		pic "On"

		files
		{
			"src/linux_joystick.h",
			"src/linux_joystick.c",
			"src/posix_module.c",
			"src/posix_thread.h",
			"src/posix_thread.c",
			"src/posix_time.h",
			"src/posix_time.c",
			"src/posix_poll.h",
			"src/posix_poll.c",
			"src/x11_init.c",
			"src/x11_monitor.c",
			"src/x11_platform.h",
			"src/x11_window.c",
			"src/xkb_unicode.h",
			"src/xkb_unicode.c",
			"src/glx_context.c"
		}

		defines
		{
			"_GLFW_X11"
		}

	filter "configurations:Debug"
		optimize "Off"
		runtime "Debug"
		symbols "On"

	filter "configurations:Release"
		optimize "On"
		runtime "Release"
		symbols	"On"

		flags
		{
			"LinkTimeOptimization"
		}

	filter "configurations:Dist"
		optimize "Full"
		runtime "Release"
		symbols	"Off"

		flags
		{
			"LinkTimeOptimization"
		}
