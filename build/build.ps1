properties{
$build_dir = Resolve-Path .
$solution_dir = Resolve-Path ..
$solution_file = "$solution_dir/Liberty.sln";
$build_artifacts_dir = "$build_dir\build_artifacts"

$tools_dir = "$solution_dir/packages"
$test_dir = "C:\David\Work\PetProject\Liberty\Liberty.Tests\bin\Debug"
}

Task default -depends Clean, Compile, RunTests

Task Compile {
msbuild "$solution_file";
}

Task Clean {
rd $build_artifacts_dir -recurse -force  -ErrorAction SilentlyContinue | out-null
mkdir $build_artifacts_dir  -ErrorAction SilentlyContinue  | out-null
}

task RunTests {    
$testassemblies = get-childitem $test_dir -recurse -include *tests*.dll
	exec { 
		& C:\David\Work\PetProject\Liberty\packages\NUnit.2.6.4\bin\nunit-console-x86.exe $testassemblies /nologo /nodots /xml=$test_dir\tests_results.xml; 
	}
}