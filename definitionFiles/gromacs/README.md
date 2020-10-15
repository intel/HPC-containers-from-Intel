# Intel-Hpc-Containers

 - LEGAL NOTICE: By downloading and using this build file (the “Software Package”) and the included software or software made available for download, you agree to the terms and conditions of the software license agreements for the Software Package, which may also include notices, disclaimers, or license terms for third party software (together, the “Agreements”) included in this README file.
 
 - This Singularity definition file will automatically download :
 
 		* GROMACS under GNU LESSER GENERAL PUBLIC LICENSE Version 3, 29 June 2007 
			- Download Location: (http://www.gromacs.org)
			- License: (http://www.gromacs.org/About_Gromacs)
		* GROMACS Benchmark Files that are Public Domain

--------------------------------------------------------------
Create containers with Singularity version 3.x for HPC apps for Single and Cluster runs for Intel avx512 enabled plarforms:

o	The Singularity definition file will require these programs to be pre-installed:

	- Singularity 3.x version (https://sylabs.io/guides/3.5/admin-guide/installation.html)
	- Intel® Parallel Studio XE (https://software.intel.com/content/www/us/en/develop/tools/parallel-studio-xe/choose-download.html)
	- Super user access to the system 
	- Centos (for other OSs, you will need to modify the instructions/recipe accordingly)
 

Instructions to build a container:

1.   Build the binaries and dependencies from the Build definition file :

     `$ sudo singularity build <ContainerName.simg> <nameBuild.def>`

This will generate the binaries that you will need in step #3 and a dummy container <ContainerName.simg> that you can just use or ignore


2.  Build the base container that includes the OS, Intel runtime libraries, and some independencies . Build it from the "Run" definition file as:
	
     `$ sudo singularity build /tmp/base.simg base`


3.   Build the container . You may need to adjust and tweak the recipe a little bit to point out to your binaries, programs, and dependencies. You will need:
	
*   The binaries from step #1
*   The /tmp/base.simg container from step #2

    `$ sudo singularity build --force <containerName.simg> <namdRun.def>` 
    

**Run instructions**:

`$ singularity run-help <containerName.simg>`

