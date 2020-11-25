currentdir=`pwd`
cd /home/liufeng_pkuhpc/lustre2/zgh/zgh_lmp/lmp_use/
gitget
cd $currentdir
source /home/liufeng_pkuhpc/lustre2/zgh/zgh_lmp/lmp_use/lammps_29Oct2020.sh auto

rundir=$1
sub_infile=$2
#rm -rf $rundir
if [ ! -d $rundir ]; then
    mkdir $rundir 
    cd $rundir
    lmp -in ../infiles/init.in
    source ../make_atomfile.sh
    sbatch /home/liufeng_pkuhpc/lustre2/zgh/zgh_lmp/lmp_use/sub_lmp.sh $sub_infile
    cd ..
else
    echo 'Already exists! Please make sure!'
fi