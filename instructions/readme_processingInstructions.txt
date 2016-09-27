Instruction for processing NODDI data

Part I Setting up the processing environment
Step XXX Set up the virtual machine image

Step XXX Copy data into the VM

Step XXX Set up the code repos
1 NIfti_20140122
2 process7T
3 noddi
4 afni_matlab path

Step XXX Set up environmental variables in ~/.cshrc
NODDI_PATH=/home/rbussell/repos/noddi
PROCESS7T_PATH=/home/rbussell/repos/process7T
NIFTI_PATH=/home/rbussell/matlab/NIfTI_20140122/
AFNI_MATLAB_PATH=/apps/afni_matlab/matlab

Part II Prepare input files
A. Bruker data
Step XXX Convert the Bruker data to nifti files (if Bruker data)
To create input nifti files from bruker data, see the script in the noddi repo called noddi_brukerMakeNiftiFilesExample.m

Part III Prepare the bvecs and bvals files
A. Bruker data
Step XXX Check for existing bvecs and bvals files
pniPilot data: noddi repo noddi/gradientTables/pniPilot160817

Step XXX Create a bvecs_single file for Bruker data
cd examplebrukerdata.CD1 # for example
$NODDI_PATH/noddi_getBValsBruker 5 > bvecs_single
mv bvecs_single ../processed
cd ../processed

Step XXX Create a bvals_single file for bruker data
750
1500
2000

Step XXX Create the multi-shell bvals and bvecs files
$NODDI_PATH/noddi_makeMultiShellBvalsBvecs bvecs_single bvals_single 5 3 750 1500 2000

Step XXX Make a mouse brain mask
noddi_makeMaskMouse dti_pre_m1.nii.gz 5

Step XXX Set up the data dir
ln -s brain_mask.nii.gz mask.nii.gz
ln -s brain_roi.nii.gz mask_mask.nii.gz
ln -s ../bvals_multi.txt 
ln -s../bvecs_multi.txt
noddi_setupData dti_pre_m1.nii.gz pniPilot pniPilot/m1 bvals_multi.txt bvecs_multi.txt

Step XXX run the noddi processing
$NODDI_PATH/noddi_runAmicoNoddi
