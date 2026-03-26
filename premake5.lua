group "Dependencies"
		project "JoltPhysics"
			kind "StaticLib"
			language "C++"
			cppdialect "C++17"
			architecture "x64"
			staticruntime "off"
			targetdir ("%{wks.location}/bin/" .. outputdir)
			objdir ("%{wks.location}/obj/" .. tmpdir)

			-- Jolt source files (library core only)
			files
			{
				"Jolt/**.h",
				"Jolt/**.cpp"
			}

			-- Include path: so that #include <Jolt/Jolt.h> works
			includedirs
			{
				"."
			}

			defines
			{
				"JPH_DEBUG_RENDERER",
				"_CRT_SECURE_NO_WARNINGS",
				"NOMINMAX"
			}

			disablewarnings { "4996", "5054", "4244", "4267" }
			buildoptions { "/utf-8" }

			filter "configurations:Debug"
				defines { "DEBUG", "JPH_ENABLE_ASSERTS" }
				runtime "Debug"
				symbols "On"
				optimize "Off"

			filter "configurations:Release"
				defines { "NDEBUG" }
				runtime "Release"
				optimize "Full"

group ""
