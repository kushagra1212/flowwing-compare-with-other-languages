#!/bin/bash

# set locale so that float numbers can be correctly parsed
LC_NUMERIC=C

runs=5  # Number of runs
output_file="benchmark_results.csv"

echo "Language,Run,Time_ns" > "$output_file"




# Helper function to extract nanoseconds from time output
extract_ns() {
    local time_output="$1"
    echo "Time Output: $time_output" >&2  # Debug: print the time output to stderr
    local user_time=$(echo "$time_output" | grep "user" | awk '{print $2}')
    echo "User Time: $user_time" >&2      # Debug: print user time
    # Use awk to extract the seconds value, removing "m"
    local seconds=$(echo "$user_time" | awk -F'm' '{print $2}' | cut -d's' -f1)
     echo "Seconds: $seconds" >&2    #Debug :print seconds extracted
     # convert time to nanoseconds using printf (bash builtin)
     printf -v nanoseconds "%.0f" $(echo "$seconds * 1000000000" | bc)
    echo "nanoseconds: $nanoseconds" >&2 # Debug: print nanoseconds extracted
    echo "$nanoseconds"
}



# Java
javac Benchmark.java  # Compile once outside the loop
for ((i=1; i<=$runs; i++))
do
    time_output=$( { time java Benchmark; } 2>&1 ) # Capture output and stderr
    time_ns=$(extract_ns "$time_output")
    echo "Java,$i,$time_ns" >> "$output_file"
done

# Javascript
for ((i=1; i<=$runs; i++))
do
    time_output=$( { time node benchmark.js; } 2>&1 )
    time_ns=$(extract_ns "$time_output")
    echo "JavaScript,$i,$time_ns" >> "$output_file"
done

# C++
g++ benchmark.cpp -o benchmark -O3 # Compile once
for ((i=1; i<=$runs; i++))
do
    time_output=$( { time ./benchmark; } 2>&1 )
    time_ns=$(extract_ns "$time_output")
    echo "Cpp,$i,$time_ns" >> "$output_file"
done

# FlowWing
FlowWing benchmark.fg -o # Compile once
for ((i=1; i<=$runs; i++))
do
    time_output=$( { time ./build/bin/benchmark; } 2>&1 )
    time_ns=$(extract_ns "$time_output")
    echo "FlowWing,$i,$time_ns" >> "$output_file"
done


# Python
for ((i=1; i<=$runs; i++))
do
    time_output=$( { time python3 benchmark.py; } 2>&1 )
    time_ns=$(extract_ns "$time_output")
    echo "Python,$i,$time_ns" >> "$output_file"
done
echo "Benchmark finished. Results saved in $output_file"