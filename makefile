CXX=g++
FLAGS=-std=c++14
C_FILES=Date.cpp Datetime.cpp GeoLocation.cpp SolidEarthFlexing.cpp

all:
	$(CXX) $(FLAGS) $(C_FILES) -o SolidEarthFlexing
	gfortran solid.f -o solid


cpp:
	$(CXX) $(FLAGS) $(C_FILES) -o SolidEarthFlexing


fortran:
	gfortran solid.f -o solid


######################################### TESTING #########################################

test:
	$(CXX) $(FLAGS) $(C_FILES) -D _TESTING_ -o Testing/SolidEarthFlexing
	Testing/SolidEarthFlexing < Testing/cpp_input.txt > Testing/cpp_output.txt
	gfortran Testing/solid.f -o Testing/solid
	Testing/solid < Testing/fortran_input.txt > Testing/fortran_output.txt


cpp_test:
	$(CXX) $(FLAGS) $(C_FILES) -D _TESTING_ -o Testing/SolidEarthFlexing

run_cpp_test:
	Testing/SolidEarthFlexing < Testing/cpp_input.txt > Testing/cpp_output.txt


fortran_test:
	gfortran Testing/solid.f -o Testing/solid

run_fortran_test:
	Testing/solid < Testing/fortran_input.txt > Testing/fortran_output.txt
