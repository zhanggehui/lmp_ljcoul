#!/bin/bash
#SBATCH -J lmp_pos
#SBATCH -p cn-short
#SBATCH -N 1
#SBATCH --qos=liufengcns
#SBATCH -o 1.out
#SBATCH -e 2.err
#SBATCH --no-requeue
#SBATCH -A liufeng_g1

hosts=`scontrol show hostname $SLURM_JOB_NODELIST`; echo $hosts
source /home/liufeng_pkuhpc/lustre2/zgh/zgh_lmp/lmp_ljcoul/make_newtype.sh run2
