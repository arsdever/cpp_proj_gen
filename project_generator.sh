#!/usr/bin/bash

# Generate the folder structure

rm  -fr ./*
mkdir src test include -p

# Generate CMakeLists structure

echo "cmake_minimum_required (VERSION 3.10)

project (cpp_proj_base)

add_subdirectory (src)

if (BUILD_TESTING)
	enable_testing ()
	add_subdirectory (test)
endif (BUILD_TESTING)" > ./CMakeLists.txt

echo "add_executable (test_app test_main.cpp)

target_include_directories (test_app
PUBLIC
	\${CMAKE_SOURCE_DIR}/include
)

add_test (test_app COMMAND test_app)" > ./test/CMakeLists.txt

echo "add_executable (app main.cpp)

target_include_directories (app
PUBLIC
	\${CMAKE_SOURCE_DIR}/include
)" > ./src/CMakeLists.txt

# Generate source files

echo "#include <iostream>

int main(int argc, char** argv)
{
	std::cout << \"Sample test passes.\" << std::endl;
	return 0;
}" > ./test/test_main.cpp

echo "#include <iostream>

int main(int argc, char** argv)
{
	std::cout << \"Sample app.\" << std::endl;
	return 0;
}" > ./src/main.cpp

name=$(git config --list | sed "s/user.name=\\(.*\\)/\\1/p" -n)

if [ -z "$name" ]
then
	echo "LICENSE file not generated. Couldn't fetch the full name from the git configuration"
else
echo "Copyright $(date +"%Y") $name

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE." > LICENSE
fi