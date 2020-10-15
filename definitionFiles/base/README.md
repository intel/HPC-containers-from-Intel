# Intel-Hpc-Containers

 - LEGAL NOTICE: By downloading and using this container or script as applicable (the “Software Package”) and the included software or software made available for download, you agree to the terms and conditions of the software license agreements for the Software Package, which may also include notices, disclaimers, or license terms for third party software (together, the “Agreements”) included in this README file  
 - This Singularity definition file will automatically download :
 
 		* CentOS 
			- (http://mirror.centos.org)
			- (http://mirror.centos.org/centos/7/os/x86_64/EULA)
			- Licenses for this bundle are also accessible through the shell at /usr/share/licenses/
		* Intel® Parallel Studio XE Runtime 2020
			- (https://yum.repos.intel.com/2020/setup/RPM-GPG-KEY-intel-psxe-runtime-2020)
			- (https://software.intel.com/en-us/license/end-user-license-agreement-for-the-intel-compiler-runtime-libraries)


--------------------------------------------------------------
Create containers with Singularity version 3.x for HPC apps for Single and Cluster runs for Intel avx512 enabled plarforms:

o	The Singularity definition file will require these programs to be pre-installed:

	- GCC7.3
	- Singularity 3.x version
	- Super user access to the system 
	- Centos (for other OSs, you will need to modify the instructions/recipe accordingly)
 

Instructions to build a container:

1.  Build the base container that includes the OS, Intel runtime libraries, and some independencies . Build it from definition file as:
	
     `$ sudo singularity build /tmp/base.simg base.def`

**Run instructions**:

`$ singularity run-help <containerName.simg>`

