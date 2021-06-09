/*

File Name : HelloWorld.cu

File Description: Print Hello World using CPU and CPU

File Author : Arul Prakash Samathuvamani - hello@arulprakash.dev - https://arulprakash.dev

Date: 6/10/2021

*/


// Declare Headers

#include <stdio.h>
#include "cuda_runtime.h"
#include "device_launch_parameters.h"

// Declaration of function to run on CPU
void cpu_run_function() {

	printf("This Function is run by the CPU \n"); // This runs on CPU

}

// Declaration of function that is to be run on GPU.
__global__ 
void gpu_run_function() {

	printf("This function is run by GPU \n"); // This runs on GPU

}

// Main function, runs on CPU

int main() {
	 
	printf("Running the function \n");


	cpu_run_function(); // Call CPU function

	gpu_run_function <<<10, 10 >>> (); // Call GPU function with 10 blocks each with 10 threads

	cudaDeviceSynchronize(); // Wait for the process to finish

	cpu_run_function(); // Run CPU function again

	// Replicate this function without cudaDeviceSynchronise()

	return 0;
}