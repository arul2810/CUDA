#include <stdio.h>
#include "cuda_runtime.h"
#include "device_launch_parameters.h"


void cpu_run_function() {

	printf("This Function is run by the CPU \n");

}

__global__ 
void gpu_run_function() {

	printf("This function is run by GPU \n");

}


int main() {

	printf("Running the function \n");


	cpu_run_function();

	gpu_run_function <<<10, 10 >>> ();

	cudaDeviceSynchronize();

	cpu_run_function();

	return 0;
}