# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.28

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Disable VCS-based implicit rules.
% : %,v

# Disable VCS-based implicit rules.
% : RCS/%

# Disable VCS-based implicit rules.
% : RCS/%,v

# Disable VCS-based implicit rules.
% : SCCS/s.%

# Disable VCS-based implicit rules.
% : s.%

.SUFFIXES: .hpux_make_needs_suffix_list

# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/zzzccc/cxzz/Kotoamatsukami

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/zzzccc/cxzz/Kotoamatsukami/build

# Include any dependencies generated for this target.
include CMakeFiles/Kotoamatsukami.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include CMakeFiles/Kotoamatsukami.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/Kotoamatsukami.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/Kotoamatsukami.dir/flags.make

CMakeFiles/Kotoamatsukami.dir/src/PassPlugin.cpp.o: CMakeFiles/Kotoamatsukami.dir/flags.make
CMakeFiles/Kotoamatsukami.dir/src/PassPlugin.cpp.o: /home/zzzccc/cxzz/Kotoamatsukami/src/PassPlugin.cpp
CMakeFiles/Kotoamatsukami.dir/src/PassPlugin.cpp.o: CMakeFiles/Kotoamatsukami.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/home/zzzccc/cxzz/Kotoamatsukami/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/Kotoamatsukami.dir/src/PassPlugin.cpp.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/Kotoamatsukami.dir/src/PassPlugin.cpp.o -MF CMakeFiles/Kotoamatsukami.dir/src/PassPlugin.cpp.o.d -o CMakeFiles/Kotoamatsukami.dir/src/PassPlugin.cpp.o -c /home/zzzccc/cxzz/Kotoamatsukami/src/PassPlugin.cpp

CMakeFiles/Kotoamatsukami.dir/src/PassPlugin.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/Kotoamatsukami.dir/src/PassPlugin.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/zzzccc/cxzz/Kotoamatsukami/src/PassPlugin.cpp > CMakeFiles/Kotoamatsukami.dir/src/PassPlugin.cpp.i

CMakeFiles/Kotoamatsukami.dir/src/PassPlugin.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/Kotoamatsukami.dir/src/PassPlugin.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/zzzccc/cxzz/Kotoamatsukami/src/PassPlugin.cpp -o CMakeFiles/Kotoamatsukami.dir/src/PassPlugin.cpp.s

CMakeFiles/Kotoamatsukami.dir/src/pass/AddJunkCodePass.cpp.o: CMakeFiles/Kotoamatsukami.dir/flags.make
CMakeFiles/Kotoamatsukami.dir/src/pass/AddJunkCodePass.cpp.o: /home/zzzccc/cxzz/Kotoamatsukami/src/pass/AddJunkCodePass.cpp
CMakeFiles/Kotoamatsukami.dir/src/pass/AddJunkCodePass.cpp.o: CMakeFiles/Kotoamatsukami.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/home/zzzccc/cxzz/Kotoamatsukami/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object CMakeFiles/Kotoamatsukami.dir/src/pass/AddJunkCodePass.cpp.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/Kotoamatsukami.dir/src/pass/AddJunkCodePass.cpp.o -MF CMakeFiles/Kotoamatsukami.dir/src/pass/AddJunkCodePass.cpp.o.d -o CMakeFiles/Kotoamatsukami.dir/src/pass/AddJunkCodePass.cpp.o -c /home/zzzccc/cxzz/Kotoamatsukami/src/pass/AddJunkCodePass.cpp

CMakeFiles/Kotoamatsukami.dir/src/pass/AddJunkCodePass.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/Kotoamatsukami.dir/src/pass/AddJunkCodePass.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/zzzccc/cxzz/Kotoamatsukami/src/pass/AddJunkCodePass.cpp > CMakeFiles/Kotoamatsukami.dir/src/pass/AddJunkCodePass.cpp.i

CMakeFiles/Kotoamatsukami.dir/src/pass/AddJunkCodePass.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/Kotoamatsukami.dir/src/pass/AddJunkCodePass.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/zzzccc/cxzz/Kotoamatsukami/src/pass/AddJunkCodePass.cpp -o CMakeFiles/Kotoamatsukami.dir/src/pass/AddJunkCodePass.cpp.s

CMakeFiles/Kotoamatsukami.dir/src/pass/Branch2Call.cpp.o: CMakeFiles/Kotoamatsukami.dir/flags.make
CMakeFiles/Kotoamatsukami.dir/src/pass/Branch2Call.cpp.o: /home/zzzccc/cxzz/Kotoamatsukami/src/pass/Branch2Call.cpp
CMakeFiles/Kotoamatsukami.dir/src/pass/Branch2Call.cpp.o: CMakeFiles/Kotoamatsukami.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/home/zzzccc/cxzz/Kotoamatsukami/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building CXX object CMakeFiles/Kotoamatsukami.dir/src/pass/Branch2Call.cpp.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/Kotoamatsukami.dir/src/pass/Branch2Call.cpp.o -MF CMakeFiles/Kotoamatsukami.dir/src/pass/Branch2Call.cpp.o.d -o CMakeFiles/Kotoamatsukami.dir/src/pass/Branch2Call.cpp.o -c /home/zzzccc/cxzz/Kotoamatsukami/src/pass/Branch2Call.cpp

CMakeFiles/Kotoamatsukami.dir/src/pass/Branch2Call.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/Kotoamatsukami.dir/src/pass/Branch2Call.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/zzzccc/cxzz/Kotoamatsukami/src/pass/Branch2Call.cpp > CMakeFiles/Kotoamatsukami.dir/src/pass/Branch2Call.cpp.i

CMakeFiles/Kotoamatsukami.dir/src/pass/Branch2Call.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/Kotoamatsukami.dir/src/pass/Branch2Call.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/zzzccc/cxzz/Kotoamatsukami/src/pass/Branch2Call.cpp -o CMakeFiles/Kotoamatsukami.dir/src/pass/Branch2Call.cpp.s

CMakeFiles/Kotoamatsukami.dir/src/pass/Branch2Call_32.cpp.o: CMakeFiles/Kotoamatsukami.dir/flags.make
CMakeFiles/Kotoamatsukami.dir/src/pass/Branch2Call_32.cpp.o: /home/zzzccc/cxzz/Kotoamatsukami/src/pass/Branch2Call_32.cpp
CMakeFiles/Kotoamatsukami.dir/src/pass/Branch2Call_32.cpp.o: CMakeFiles/Kotoamatsukami.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/home/zzzccc/cxzz/Kotoamatsukami/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building CXX object CMakeFiles/Kotoamatsukami.dir/src/pass/Branch2Call_32.cpp.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/Kotoamatsukami.dir/src/pass/Branch2Call_32.cpp.o -MF CMakeFiles/Kotoamatsukami.dir/src/pass/Branch2Call_32.cpp.o.d -o CMakeFiles/Kotoamatsukami.dir/src/pass/Branch2Call_32.cpp.o -c /home/zzzccc/cxzz/Kotoamatsukami/src/pass/Branch2Call_32.cpp

CMakeFiles/Kotoamatsukami.dir/src/pass/Branch2Call_32.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/Kotoamatsukami.dir/src/pass/Branch2Call_32.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/zzzccc/cxzz/Kotoamatsukami/src/pass/Branch2Call_32.cpp > CMakeFiles/Kotoamatsukami.dir/src/pass/Branch2Call_32.cpp.i

CMakeFiles/Kotoamatsukami.dir/src/pass/Branch2Call_32.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/Kotoamatsukami.dir/src/pass/Branch2Call_32.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/zzzccc/cxzz/Kotoamatsukami/src/pass/Branch2Call_32.cpp -o CMakeFiles/Kotoamatsukami.dir/src/pass/Branch2Call_32.cpp.s

CMakeFiles/Kotoamatsukami.dir/src/pass/ForObsPass.cpp.o: CMakeFiles/Kotoamatsukami.dir/flags.make
CMakeFiles/Kotoamatsukami.dir/src/pass/ForObsPass.cpp.o: /home/zzzccc/cxzz/Kotoamatsukami/src/pass/ForObsPass.cpp
CMakeFiles/Kotoamatsukami.dir/src/pass/ForObsPass.cpp.o: CMakeFiles/Kotoamatsukami.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/home/zzzccc/cxzz/Kotoamatsukami/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Building CXX object CMakeFiles/Kotoamatsukami.dir/src/pass/ForObsPass.cpp.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/Kotoamatsukami.dir/src/pass/ForObsPass.cpp.o -MF CMakeFiles/Kotoamatsukami.dir/src/pass/ForObsPass.cpp.o.d -o CMakeFiles/Kotoamatsukami.dir/src/pass/ForObsPass.cpp.o -c /home/zzzccc/cxzz/Kotoamatsukami/src/pass/ForObsPass.cpp

CMakeFiles/Kotoamatsukami.dir/src/pass/ForObsPass.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/Kotoamatsukami.dir/src/pass/ForObsPass.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/zzzccc/cxzz/Kotoamatsukami/src/pass/ForObsPass.cpp > CMakeFiles/Kotoamatsukami.dir/src/pass/ForObsPass.cpp.i

CMakeFiles/Kotoamatsukami.dir/src/pass/ForObsPass.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/Kotoamatsukami.dir/src/pass/ForObsPass.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/zzzccc/cxzz/Kotoamatsukami/src/pass/ForObsPass.cpp -o CMakeFiles/Kotoamatsukami.dir/src/pass/ForObsPass.cpp.s

CMakeFiles/Kotoamatsukami.dir/src/pass/Loopen.cpp.o: CMakeFiles/Kotoamatsukami.dir/flags.make
CMakeFiles/Kotoamatsukami.dir/src/pass/Loopen.cpp.o: /home/zzzccc/cxzz/Kotoamatsukami/src/pass/Loopen.cpp
CMakeFiles/Kotoamatsukami.dir/src/pass/Loopen.cpp.o: CMakeFiles/Kotoamatsukami.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/home/zzzccc/cxzz/Kotoamatsukami/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_6) "Building CXX object CMakeFiles/Kotoamatsukami.dir/src/pass/Loopen.cpp.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/Kotoamatsukami.dir/src/pass/Loopen.cpp.o -MF CMakeFiles/Kotoamatsukami.dir/src/pass/Loopen.cpp.o.d -o CMakeFiles/Kotoamatsukami.dir/src/pass/Loopen.cpp.o -c /home/zzzccc/cxzz/Kotoamatsukami/src/pass/Loopen.cpp

CMakeFiles/Kotoamatsukami.dir/src/pass/Loopen.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/Kotoamatsukami.dir/src/pass/Loopen.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/zzzccc/cxzz/Kotoamatsukami/src/pass/Loopen.cpp > CMakeFiles/Kotoamatsukami.dir/src/pass/Loopen.cpp.i

CMakeFiles/Kotoamatsukami.dir/src/pass/Loopen.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/Kotoamatsukami.dir/src/pass/Loopen.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/zzzccc/cxzz/Kotoamatsukami/src/pass/Loopen.cpp -o CMakeFiles/Kotoamatsukami.dir/src/pass/Loopen.cpp.s

CMakeFiles/Kotoamatsukami.dir/src/pass/AntiDebugPass.cpp.o: CMakeFiles/Kotoamatsukami.dir/flags.make
CMakeFiles/Kotoamatsukami.dir/src/pass/AntiDebugPass.cpp.o: /home/zzzccc/cxzz/Kotoamatsukami/src/pass/AntiDebugPass.cpp
CMakeFiles/Kotoamatsukami.dir/src/pass/AntiDebugPass.cpp.o: CMakeFiles/Kotoamatsukami.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/home/zzzccc/cxzz/Kotoamatsukami/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_7) "Building CXX object CMakeFiles/Kotoamatsukami.dir/src/pass/AntiDebugPass.cpp.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/Kotoamatsukami.dir/src/pass/AntiDebugPass.cpp.o -MF CMakeFiles/Kotoamatsukami.dir/src/pass/AntiDebugPass.cpp.o.d -o CMakeFiles/Kotoamatsukami.dir/src/pass/AntiDebugPass.cpp.o -c /home/zzzccc/cxzz/Kotoamatsukami/src/pass/AntiDebugPass.cpp

CMakeFiles/Kotoamatsukami.dir/src/pass/AntiDebugPass.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/Kotoamatsukami.dir/src/pass/AntiDebugPass.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/zzzccc/cxzz/Kotoamatsukami/src/pass/AntiDebugPass.cpp > CMakeFiles/Kotoamatsukami.dir/src/pass/AntiDebugPass.cpp.i

CMakeFiles/Kotoamatsukami.dir/src/pass/AntiDebugPass.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/Kotoamatsukami.dir/src/pass/AntiDebugPass.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/zzzccc/cxzz/Kotoamatsukami/src/pass/AntiDebugPass.cpp -o CMakeFiles/Kotoamatsukami.dir/src/pass/AntiDebugPass.cpp.s

CMakeFiles/Kotoamatsukami.dir/src/pass/SplitBasicBlock.cpp.o: CMakeFiles/Kotoamatsukami.dir/flags.make
CMakeFiles/Kotoamatsukami.dir/src/pass/SplitBasicBlock.cpp.o: /home/zzzccc/cxzz/Kotoamatsukami/src/pass/SplitBasicBlock.cpp
CMakeFiles/Kotoamatsukami.dir/src/pass/SplitBasicBlock.cpp.o: CMakeFiles/Kotoamatsukami.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/home/zzzccc/cxzz/Kotoamatsukami/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_8) "Building CXX object CMakeFiles/Kotoamatsukami.dir/src/pass/SplitBasicBlock.cpp.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/Kotoamatsukami.dir/src/pass/SplitBasicBlock.cpp.o -MF CMakeFiles/Kotoamatsukami.dir/src/pass/SplitBasicBlock.cpp.o.d -o CMakeFiles/Kotoamatsukami.dir/src/pass/SplitBasicBlock.cpp.o -c /home/zzzccc/cxzz/Kotoamatsukami/src/pass/SplitBasicBlock.cpp

CMakeFiles/Kotoamatsukami.dir/src/pass/SplitBasicBlock.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/Kotoamatsukami.dir/src/pass/SplitBasicBlock.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/zzzccc/cxzz/Kotoamatsukami/src/pass/SplitBasicBlock.cpp > CMakeFiles/Kotoamatsukami.dir/src/pass/SplitBasicBlock.cpp.i

CMakeFiles/Kotoamatsukami.dir/src/pass/SplitBasicBlock.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/Kotoamatsukami.dir/src/pass/SplitBasicBlock.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/zzzccc/cxzz/Kotoamatsukami/src/pass/SplitBasicBlock.cpp -o CMakeFiles/Kotoamatsukami.dir/src/pass/SplitBasicBlock.cpp.s

CMakeFiles/Kotoamatsukami.dir/src/pass/IndirectBranch.cpp.o: CMakeFiles/Kotoamatsukami.dir/flags.make
CMakeFiles/Kotoamatsukami.dir/src/pass/IndirectBranch.cpp.o: /home/zzzccc/cxzz/Kotoamatsukami/src/pass/IndirectBranch.cpp
CMakeFiles/Kotoamatsukami.dir/src/pass/IndirectBranch.cpp.o: CMakeFiles/Kotoamatsukami.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/home/zzzccc/cxzz/Kotoamatsukami/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_9) "Building CXX object CMakeFiles/Kotoamatsukami.dir/src/pass/IndirectBranch.cpp.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/Kotoamatsukami.dir/src/pass/IndirectBranch.cpp.o -MF CMakeFiles/Kotoamatsukami.dir/src/pass/IndirectBranch.cpp.o.d -o CMakeFiles/Kotoamatsukami.dir/src/pass/IndirectBranch.cpp.o -c /home/zzzccc/cxzz/Kotoamatsukami/src/pass/IndirectBranch.cpp

CMakeFiles/Kotoamatsukami.dir/src/pass/IndirectBranch.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/Kotoamatsukami.dir/src/pass/IndirectBranch.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/zzzccc/cxzz/Kotoamatsukami/src/pass/IndirectBranch.cpp > CMakeFiles/Kotoamatsukami.dir/src/pass/IndirectBranch.cpp.i

CMakeFiles/Kotoamatsukami.dir/src/pass/IndirectBranch.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/Kotoamatsukami.dir/src/pass/IndirectBranch.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/zzzccc/cxzz/Kotoamatsukami/src/pass/IndirectBranch.cpp -o CMakeFiles/Kotoamatsukami.dir/src/pass/IndirectBranch.cpp.s

CMakeFiles/Kotoamatsukami.dir/src/pass/IndirectCall.cpp.o: CMakeFiles/Kotoamatsukami.dir/flags.make
CMakeFiles/Kotoamatsukami.dir/src/pass/IndirectCall.cpp.o: /home/zzzccc/cxzz/Kotoamatsukami/src/pass/IndirectCall.cpp
CMakeFiles/Kotoamatsukami.dir/src/pass/IndirectCall.cpp.o: CMakeFiles/Kotoamatsukami.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/home/zzzccc/cxzz/Kotoamatsukami/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_10) "Building CXX object CMakeFiles/Kotoamatsukami.dir/src/pass/IndirectCall.cpp.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/Kotoamatsukami.dir/src/pass/IndirectCall.cpp.o -MF CMakeFiles/Kotoamatsukami.dir/src/pass/IndirectCall.cpp.o.d -o CMakeFiles/Kotoamatsukami.dir/src/pass/IndirectCall.cpp.o -c /home/zzzccc/cxzz/Kotoamatsukami/src/pass/IndirectCall.cpp

CMakeFiles/Kotoamatsukami.dir/src/pass/IndirectCall.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/Kotoamatsukami.dir/src/pass/IndirectCall.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/zzzccc/cxzz/Kotoamatsukami/src/pass/IndirectCall.cpp > CMakeFiles/Kotoamatsukami.dir/src/pass/IndirectCall.cpp.i

CMakeFiles/Kotoamatsukami.dir/src/pass/IndirectCall.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/Kotoamatsukami.dir/src/pass/IndirectCall.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/zzzccc/cxzz/Kotoamatsukami/src/pass/IndirectCall.cpp -o CMakeFiles/Kotoamatsukami.dir/src/pass/IndirectCall.cpp.s

CMakeFiles/Kotoamatsukami.dir/src/pass/BogusControlFlow.cpp.o: CMakeFiles/Kotoamatsukami.dir/flags.make
CMakeFiles/Kotoamatsukami.dir/src/pass/BogusControlFlow.cpp.o: /home/zzzccc/cxzz/Kotoamatsukami/src/pass/BogusControlFlow.cpp
CMakeFiles/Kotoamatsukami.dir/src/pass/BogusControlFlow.cpp.o: CMakeFiles/Kotoamatsukami.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/home/zzzccc/cxzz/Kotoamatsukami/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_11) "Building CXX object CMakeFiles/Kotoamatsukami.dir/src/pass/BogusControlFlow.cpp.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/Kotoamatsukami.dir/src/pass/BogusControlFlow.cpp.o -MF CMakeFiles/Kotoamatsukami.dir/src/pass/BogusControlFlow.cpp.o.d -o CMakeFiles/Kotoamatsukami.dir/src/pass/BogusControlFlow.cpp.o -c /home/zzzccc/cxzz/Kotoamatsukami/src/pass/BogusControlFlow.cpp

CMakeFiles/Kotoamatsukami.dir/src/pass/BogusControlFlow.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/Kotoamatsukami.dir/src/pass/BogusControlFlow.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/zzzccc/cxzz/Kotoamatsukami/src/pass/BogusControlFlow.cpp > CMakeFiles/Kotoamatsukami.dir/src/pass/BogusControlFlow.cpp.i

CMakeFiles/Kotoamatsukami.dir/src/pass/BogusControlFlow.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/Kotoamatsukami.dir/src/pass/BogusControlFlow.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/zzzccc/cxzz/Kotoamatsukami/src/pass/BogusControlFlow.cpp -o CMakeFiles/Kotoamatsukami.dir/src/pass/BogusControlFlow.cpp.s

CMakeFiles/Kotoamatsukami.dir/src/utils/utils.cpp.o: CMakeFiles/Kotoamatsukami.dir/flags.make
CMakeFiles/Kotoamatsukami.dir/src/utils/utils.cpp.o: /home/zzzccc/cxzz/Kotoamatsukami/src/utils/utils.cpp
CMakeFiles/Kotoamatsukami.dir/src/utils/utils.cpp.o: CMakeFiles/Kotoamatsukami.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/home/zzzccc/cxzz/Kotoamatsukami/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_12) "Building CXX object CMakeFiles/Kotoamatsukami.dir/src/utils/utils.cpp.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/Kotoamatsukami.dir/src/utils/utils.cpp.o -MF CMakeFiles/Kotoamatsukami.dir/src/utils/utils.cpp.o.d -o CMakeFiles/Kotoamatsukami.dir/src/utils/utils.cpp.o -c /home/zzzccc/cxzz/Kotoamatsukami/src/utils/utils.cpp

CMakeFiles/Kotoamatsukami.dir/src/utils/utils.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/Kotoamatsukami.dir/src/utils/utils.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/zzzccc/cxzz/Kotoamatsukami/src/utils/utils.cpp > CMakeFiles/Kotoamatsukami.dir/src/utils/utils.cpp.i

CMakeFiles/Kotoamatsukami.dir/src/utils/utils.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/Kotoamatsukami.dir/src/utils/utils.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/zzzccc/cxzz/Kotoamatsukami/src/utils/utils.cpp -o CMakeFiles/Kotoamatsukami.dir/src/utils/utils.cpp.s

CMakeFiles/Kotoamatsukami.dir/src/utils/config.cpp.o: CMakeFiles/Kotoamatsukami.dir/flags.make
CMakeFiles/Kotoamatsukami.dir/src/utils/config.cpp.o: /home/zzzccc/cxzz/Kotoamatsukami/src/utils/config.cpp
CMakeFiles/Kotoamatsukami.dir/src/utils/config.cpp.o: CMakeFiles/Kotoamatsukami.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/home/zzzccc/cxzz/Kotoamatsukami/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_13) "Building CXX object CMakeFiles/Kotoamatsukami.dir/src/utils/config.cpp.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/Kotoamatsukami.dir/src/utils/config.cpp.o -MF CMakeFiles/Kotoamatsukami.dir/src/utils/config.cpp.o.d -o CMakeFiles/Kotoamatsukami.dir/src/utils/config.cpp.o -c /home/zzzccc/cxzz/Kotoamatsukami/src/utils/config.cpp

CMakeFiles/Kotoamatsukami.dir/src/utils/config.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/Kotoamatsukami.dir/src/utils/config.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/zzzccc/cxzz/Kotoamatsukami/src/utils/config.cpp > CMakeFiles/Kotoamatsukami.dir/src/utils/config.cpp.i

CMakeFiles/Kotoamatsukami.dir/src/utils/config.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/Kotoamatsukami.dir/src/utils/config.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/zzzccc/cxzz/Kotoamatsukami/src/utils/config.cpp -o CMakeFiles/Kotoamatsukami.dir/src/utils/config.cpp.s

# Object files for target Kotoamatsukami
Kotoamatsukami_OBJECTS = \
"CMakeFiles/Kotoamatsukami.dir/src/PassPlugin.cpp.o" \
"CMakeFiles/Kotoamatsukami.dir/src/pass/AddJunkCodePass.cpp.o" \
"CMakeFiles/Kotoamatsukami.dir/src/pass/Branch2Call.cpp.o" \
"CMakeFiles/Kotoamatsukami.dir/src/pass/Branch2Call_32.cpp.o" \
"CMakeFiles/Kotoamatsukami.dir/src/pass/ForObsPass.cpp.o" \
"CMakeFiles/Kotoamatsukami.dir/src/pass/Loopen.cpp.o" \
"CMakeFiles/Kotoamatsukami.dir/src/pass/AntiDebugPass.cpp.o" \
"CMakeFiles/Kotoamatsukami.dir/src/pass/SplitBasicBlock.cpp.o" \
"CMakeFiles/Kotoamatsukami.dir/src/pass/IndirectBranch.cpp.o" \
"CMakeFiles/Kotoamatsukami.dir/src/pass/IndirectCall.cpp.o" \
"CMakeFiles/Kotoamatsukami.dir/src/pass/BogusControlFlow.cpp.o" \
"CMakeFiles/Kotoamatsukami.dir/src/utils/utils.cpp.o" \
"CMakeFiles/Kotoamatsukami.dir/src/utils/config.cpp.o"

# External object files for target Kotoamatsukami
Kotoamatsukami_EXTERNAL_OBJECTS =

Kotoamatsukami.so: CMakeFiles/Kotoamatsukami.dir/src/PassPlugin.cpp.o
Kotoamatsukami.so: CMakeFiles/Kotoamatsukami.dir/src/pass/AddJunkCodePass.cpp.o
Kotoamatsukami.so: CMakeFiles/Kotoamatsukami.dir/src/pass/Branch2Call.cpp.o
Kotoamatsukami.so: CMakeFiles/Kotoamatsukami.dir/src/pass/Branch2Call_32.cpp.o
Kotoamatsukami.so: CMakeFiles/Kotoamatsukami.dir/src/pass/ForObsPass.cpp.o
Kotoamatsukami.so: CMakeFiles/Kotoamatsukami.dir/src/pass/Loopen.cpp.o
Kotoamatsukami.so: CMakeFiles/Kotoamatsukami.dir/src/pass/AntiDebugPass.cpp.o
Kotoamatsukami.so: CMakeFiles/Kotoamatsukami.dir/src/pass/SplitBasicBlock.cpp.o
Kotoamatsukami.so: CMakeFiles/Kotoamatsukami.dir/src/pass/IndirectBranch.cpp.o
Kotoamatsukami.so: CMakeFiles/Kotoamatsukami.dir/src/pass/IndirectCall.cpp.o
Kotoamatsukami.so: CMakeFiles/Kotoamatsukami.dir/src/pass/BogusControlFlow.cpp.o
Kotoamatsukami.so: CMakeFiles/Kotoamatsukami.dir/src/utils/utils.cpp.o
Kotoamatsukami.so: CMakeFiles/Kotoamatsukami.dir/src/utils/config.cpp.o
Kotoamatsukami.so: CMakeFiles/Kotoamatsukami.dir/build.make
Kotoamatsukami.so: CMakeFiles/Kotoamatsukami.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --bold --progress-dir=/home/zzzccc/cxzz/Kotoamatsukami/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_14) "Linking CXX shared module Kotoamatsukami.so"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/Kotoamatsukami.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/Kotoamatsukami.dir/build: Kotoamatsukami.so
.PHONY : CMakeFiles/Kotoamatsukami.dir/build

CMakeFiles/Kotoamatsukami.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/Kotoamatsukami.dir/cmake_clean.cmake
.PHONY : CMakeFiles/Kotoamatsukami.dir/clean

CMakeFiles/Kotoamatsukami.dir/depend:
	cd /home/zzzccc/cxzz/Kotoamatsukami/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/zzzccc/cxzz/Kotoamatsukami /home/zzzccc/cxzz/Kotoamatsukami /home/zzzccc/cxzz/Kotoamatsukami/build /home/zzzccc/cxzz/Kotoamatsukami/build /home/zzzccc/cxzz/Kotoamatsukami/build/CMakeFiles/Kotoamatsukami.dir/DependInfo.cmake "--color=$(COLOR)"
.PHONY : CMakeFiles/Kotoamatsukami.dir/depend

