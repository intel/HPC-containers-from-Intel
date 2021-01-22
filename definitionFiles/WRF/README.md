 # Intel-Hpc-Containers


- LEGAL NOTICE: By downloading and using this build file (the “Software Package”) and the included software or software made available for download, you agree to the terms and conditions of the software license agreements for the Software Package, which may also include notices, disclaimers, or license terms for third party software (together, the “Agreements”) included in this README file.

- This Singularity definition file will automatically download :

 		* WRF
			- Download Location: (http://www2.mmm.ucar.edu/wrf/src/WRFV3.9.1.1.TAR.gz)
			- License: (https://raw.githubusercontent.com/wrf-model/WRF/master/LICENSE.txt)
		* Curl 
			-  Download Location: https://curl.haxx.se/download/curl-7.64.0.tar.gz)
			-  License: https://curl.haxx.se/docs/copyright.html)
		* Zlib 
			- Download Location: (http://www.zlib.net/zlib-1.2.11.tar.gz)
			- License: (https://www.zlib.net/zlib_license.html)
		* Szip 
			- Download Location: (https://support.hdfgroup.org/ftp/lib-external/szip/2.1.1/src/szip-2.1.1.tar.gz)
			- License: (https://support.hdfgroup.org/doc_resource/SZIP/Commercial_szip.html)

                Legal Notice: Commercial users may use the Szip software integrated with HDF to decode data and for internal activities that do not involve or result in the development of an Szip-based software product.

                To use this software to encode data or in the development of an Szip-based software product, a commercial user may have to acquire an appropriate license from the appropriate licensing agent. See the HDF/Szip collaborative agreement (PDF) for details.

                For clarification or further information regarding SZIP licensing, contact ICs, LLC, at: ics@ics-rhbd.com

                 For additional details: https://support.hdfgroup.org/doc_resource/SZIP/Commercial_szip.html 

		* HDF5 
			- Download Location: (https://support.hdfgroup.org/ftp/HDF5/releases/hdf5-1.8/hdf5-1.8.21/src/hdf5-1.8.21.tar.gz)
			- License: (https://support.hdfgroup.org/ftp/HDF5/releases/COPYING)
		* NetCDF-C
			- Download Location: (https://github.com/Unidata/netcdf-c/archive/v4.6.3.tar.gz)
			- License: (https://raw.githubusercontent.com/Unidata/netcdf-c/master/COPYRIGHT)
		* NetCDF-Fortran
			- Download Location: (https://github.com/Unidata/netcdf-fortran/archive/v4.4.5.tar.gz)
			- License: (https://raw.githubusercontent.com/Unidata/netcdf-fortran/master/F03Interfaces_LICENSE)
		* WRF Benchmark files 
			- Download Location: bench_2.5km (http://www2.mmm.ucar.edu/wrf/bench/conus2.5km_v3911/bench_2.5km.tar.bz2)
			- Download Location: bench_12km (http://www2.mmm.ucar.edu/wrf/bench/conus12km_v3911/bench_12km.tar.bz2)
		

--------------------------------------------------------------
Create containers with Singularity version 3.x for HPC apps for Single and Cluster runs for Intel avx512 enabled plarforms:

o	The Singularity definition file will require these programs to be pre-installed:

	- Singularity 3.x version (https://sylabs.io/guides/3.5/admin-guide/installation.html)
	- Intel® Parallel Studio XE (https://software.intel.com/content/www/us/en/develop/tools/parallel-studio-xe/choose-download.html)
	- Super user access to the system 
	- Centos (for other OSs, you will need to modify the instructions/recipe accordingly)
 

Instructions to build a container:

1.   Build the binaries and dependencies from Build recipe :

     `$ sudo singularity build <ContainerName.simg> <nameBuild.def>`

This will generate the binaries that you will need in step #3 and a dummy container <ContainerName.simg> that you can just use or ignore


2.  Build the base container that includes the OS, Intel runtime libraries, and some independencies . Build it from the base https://github.com/intel/HPC-containers-from-Intel/blob/master/definitionFiles/base/base.def  recipe as:
	
     `$ sudo singularity build /tmp/base.simg base`


3.   Build the container . You may need to adjust and tweak the recipe a little bit to point out to your binaries, programs, and dependencies. You will need:
	
*   The binaries from step #1
*   The /tmp/base.simg container from step #2

    `$ sudo singularity build --force <containerName.simg> <nameRun.def>` 
    

**Run instructions**:

`$ singularity run-help <containerName.simg>`

