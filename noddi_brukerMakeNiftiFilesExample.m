
%% Create briks from bruker DTI scans
addpath(getenv('NODDI_PATH'));

%%
studyDir='~/data/160817_pni_pilot/brukerdata/rgb_pniPilot160817.D71';
scanNum=5;
procNum=1;
outBrikDir='~/data/160817_pni_pilot/processed';
prefix='dti_pre_m1'
debugMode=1;
brikType=3

noddi_MakeDWIBrikFromBruker(studyDir, scanNum, procNum, prefix, outBrikDir)

%%
studyDir='~/data/160817_pni_pilot/brukerdata/rgb_pniPilot160817_mouse2.D71';
scanNum=6;
procNum=1;
outBrikDir='~/data/160817_pni_pilot/processed';
prefix='dtipre_m2'
debugMode=1;
brikType=3

noddi_MakeDWIBrikFromBruker(studyDir, scanNum, procNum, prefix, outBrikDir)

%%
studyDir='~/data/160817_pni_pilot/brukerdata/rgb_pniPilot160817_mouse3.D71';
scanNum=5;
procNum=1;
outBrikDir='~/data/160817_pni_pilot/processed';
prefix='dtipre_m3'
debugMode=1;
brikType=3

noddi_MakeDWIBrikFromBruker(studyDir, scanNum, procNum, prefix, outBrikDir)
