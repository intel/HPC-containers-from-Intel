# LAMMPS

Large-scale Atomic/Molecular Massively Parallel Simulator (LAMMPS) is a classical molecular dynamics code. LAMMPS can be used to simulate solid-state materials (metals, semiconductors), soft matter (biomolecules, polymers), and coarse-grained or mesoscopic systems. LAMMPS can be used to model atoms, or, more generically, as a parallel particle simulator at the atomic, meso, or continuum scale.

LAMMPS runs on single processors or in parallel using message-passing techniques with a spatial-decomposition of the simulation domain. The code is designed to be easy to modify or extend with new functionality.

Below are the details of how to get and run LAMMPS container for best performance on Intel® Xeon® family for single and cluster nodes.

***
> PS: Note that the following prerequisites must be fulfilled before running the container:

  - Intel® Xeon® family system or cluster. Cloud or bare metal 

  - Singularity must be installed and operational

See instructions [here](https://github.com/intel/Intel-HPC-Container/wiki/3.-Documentation-running-CSPs)

# Running instructions:

The LAMMPS container includes a binary optimized for AVX-512 and Intel MPI (lmp_intel_cpu_intelmpi) and example workloads included with LAMMPS for simulation of a simple atomic fluid (lj), a protein (rhodo), polyethelene (airebo), a coarse-grain liquid crystal (lc), dissipative particle dynamics (dpd), copper (eam), silicon (sw/tersoff), and coarse-grain water (water).

## Get lammps image:

You can pull the lammps container image form the Singularity hub as follow:

	$ singularity pull shub://intel/Intel-HPC-Container:lammps

OR you can build a writable image using the base:

        $ sudo singularity build --writable lammps.img shub://intel/Intel-HPC-Container:lammps
***
## Run lammps on single node:

1.  As an excutable:
	
        $ singularity run --app lammps lammps.img $NUMCORES

This will run the binary lmp_intel_cpu_intelmpi with all the workloads

2.  With the [exec](http://singularity.lbl.gov/docs-exec) command (with your own workload):

 For example to run the polyethelene example:”  

        $ source /opt/intel/psxe_runtime/linux/bin/compilervars.sh intel64
        $ mpirun -np 40 singularity exec lammps.img /lammps/lmp_intel_cpu_intelmpi -in <LOCALDIR>/in.intel.airebo -log none -pk intel 0 omp 2 -sf intel -v m 0.2 -screen /tmp/in.intel.lj.log
	
3.  From inside the container: 
       
        $ singularity shell lammps.img
        $ cd /lammps
        $ source /opt/intel/psxe_runtime/linux/bin/compilervars.sh intel64
        $ mpirun -np 40 ./lmp_intel_cpu_intelmpi -in in.intel.airebo -log none -pk intel 0 omp 2 -sf intel -v m 0.2 -screen /tmp/in.intel.lj.log

> PS. To run with your own workload, the container should have your home directory mounted or you can bind your preferred directory. [See here](https://singularity.lbl.gov/docs-mount). You can also run with the exec command. 

***

## Run lammps on a cluster:

To run the container on multinode, you need to do the following:

 * Setup your cluster
 * Get the lammps container
 * Source the compiler, mpi and mkl
 * Specify host names to run on in “hosts” file
 * Select a communication and Nextork fabric at runtime
 
 Here is an example to run interactively on 4 node with 24 cores/socket/node setup on the cloud:

	$ cat nodelist 
	compute001
	compute002
	compute003
	compute004
	
	source /opt/intel/psxe_runtime/linux/bin/compilervars.sh intel64
	source /opt/intel/psxe_runtime/linux/mkl/bin/mklvars.sh
	source /opt/intel/psxe_runtime/linux/mkl/bin/mklvars.sh intel64 
	
	$ export I_MPI_FABRICS=shm:tcp     # Set the tcp fabric to be used for communication between nodes
	$ export I_MPI_DEVICE=ssm          # Set TCP + shared memory (for SMP clusters connected via Ethernet)
	
	# run lammps on 4  Intel® Xeon® Gold nodes
	$ mpiexec.hydra -hostfile nodelist -ppn $PPN -np $NP singularity run --app multinode lammps.simg airebo

***
### Recommended links:

* [Lammps documentation on Intel platforms](https://lammps.sandia.gov/doc/Speed_intel.html)
* [Lammps recipe for Intel platforms](https://software.intel.com/en-us/articles/recipe-lammps-for-intel-xeon-phi-processors)



[Optimization Notice.](https://software.intel.com/en-us/articles/optimization-notice#opt-en)
