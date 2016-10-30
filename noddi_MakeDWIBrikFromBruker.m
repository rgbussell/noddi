function [] = noddi_MakeDWIBrikFromBruker(studyDir, scanNum, procNum, prefix, outBrikDir)

addpath(getenv('NIFTI_PATH'));
addpath(getenv('AFNI_MATLAB_PATH'));
addpath(getenv('PROCESS7T_PATH'));
addpath([getenv('PROCESS7T_PATH') '/processing']);
addpath([getenv('PROCESS7T_PATH') '/physics']);
addpath([getenv('PROCESS7T_PATH') '/utils']);

%addpath('/home/rbussell/matlab/process7T/processing/');
%addpath('/home/rbussell/matlab/afni_matlab/matlab/');
%addpath('/home/rbussell/matlab/NIfTI_20140122');

%studyDir='/opt/PV5.1/data/rbussell/nmr/GB_GP120_23_1.zJ1';
%scanNum=12;
%procNum=1;
%outBrikDir='/home/rbussell/devel/dti/160119_GB_GP120_NODDI/GP120_23';
%prefix='dti12'
debugMode=1;
brikType=3
options.typestring='3DIM_HEAD_FUNC'

pv2Brik2p3( studyDir, scanNum, procNum, ...
    outBrikDir, prefix, debugMode, brikType, options )
