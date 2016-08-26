Instructions for running NODDI processing using docker

Note: You have to have docker set up on your system to do this.

1. Create the docker image
Change to the directory that contains the file called Dockerfile in directory ../something/noddi/ supplied by CFMRI.

2. Create the docker image (this may take some time, but only needs to be done once per system
docker build -t noddi .

3. Set up your BRUKER data files in a common directory following the naming convention specified here:
b0_only.nii.gz
brain_mask.nii.gz
brain_roi.nii.gz
bvals_multi.txt
bvecs_multi.txt
dwi_brain_only.nii.gz
mask_mask.nii.gz
mask.nii.gz

4. Create the container

docker run -it --name container1 -v /Users/rbussell/data/noddidata/:/tempdata noddi 

5. Processing your data following the instructions given

docker rm -v container1
