# Intel-Hpc-Containers

 - LEGAL NOTICE: By downloading and using this build file (the “Software Package”) and the included software or software made available for download, you agree to the terms and conditions of the software license agreements for the Software Package, which may also include notices, disclaimers, or license terms for third party software (together, the “Agreements”) included in this README file.

 - This Singularity definition file will automatically download :
 
 		* CHARM++ 
			- Download Location: (http://charm.cs.illinois.edu/distrib/charm-6.8.2.tar.gz )
			- License: (http://charm.cs.illinois.edu/distrib/LICENSE)
		Legal Notice: Please note that Charm++ is licensed “for academic and research purposes only” per the terms of the license. Please review the full license text at https://charm.readthedocs.io/en/latest/license.html.” 
		* NAMD 
			- Download Location: (https://www.ks.uiuc.edu/Development/Download/download.cgi?PackageName=NAMD)
			- License: (http://www.ks.uiuc.edu/Research/namd/2.9/ug/node1.html)
		Legal Notice: Please note that NAMD is licensed for “non-commercial use only” per the terms of the license. Please review the full license text at https://www.ks.uiuc.edu/Research/namd/license.html
		* NAMD Benchmark Files 
			- APOA1 Download Location: 
			     - (http://www.ks.uiuc.edu/Research/namd/utilities/apoa1.tar.gz)
			     - (http://www.ks.uiuc.edu/Research/namd/2.13/benchmarks/apoa1_nptsr_cuda.namd)
			- STMV Download Location:
			     - (http://www.ks.uiuc.edu/Research/namd/utilities/stmv.tar.gz)
			     - (http://www.ks.uiuc.edu/Research/namd/2.13/benchmarks/stmv_nptsr_cuda.namd)
			
sed -i 's/ldbalancer.*none//g' stmv_nptsr_cuda.namd 
		* TCL 
		-	Download Location: (https://github.com/tcltk/tcl.git)
		-	License Location: (https://www.tcl.tk/software/tcltk/license.html)
--------------------------------------------------------------
Create containers with Singularity version 3.x for HPC apps for Single and Cluster runs for Intel avx512 enabled plarforms:

o	The Singularity definition file will require these programs to be pre-installed:

	      - Singularity 3.x version (https://sylabs.io/guides/3.5/admin-guide/installation.html)
              - Intel® Parallel Studio XE (https://software.intel.com/content/www/us/en/develop/tools/parallel-studio-xe/choose-download.html)
              - Super user access to the system 
              - Centos (for other OSs, you will need to modify the instructions/recipe accordingly)

 

Instructions to build a container:

1.   Build the binaries and dependencies from the Build definitin file :

     `$ sudo singularity build <ContainerName.simg> <NameBuild.def>`

This will generate the binaries that you will need in step #3 and a container <ContainerName.simg> that you can use or ignore


2.  Build the base container that includes the OS, Intel runtime libraries, and some independencies . Build it from the base https://github.com/intel/HPC-containers-from-Intel/blob/master/definitionFiles/base/base.def recipe as:
	
     `$ sudo singularity build /tmp/base.simg base`


3.   Build the container . You may need to adjust and tweak the recipe a little bit to point out to your binaries, programs, and dependencies. You will need:
	
*   The binaries from step #1
*   The /tmp/base.simg container from step #2

    `$ sudo singularity build --force <containerName.simg> <NameRun.def>` 
    

**Run instructions**:

`$ singularity run-help <containerName.simg>`

