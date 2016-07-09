--Multi-subject NODDI--
noddiPreprocScript <-- run this first to generate input files
procAllSubjects <-- called by noddiPreprocScript
procOneSubject <-- called by procAllSubjects

runNoddiAmicoScriptAll <--run this after noddiPreprocScript
noddiAmicoScript <-- Called by runNoddiAmicoScriptAll

-----------------------

For multi-subject study, set up input data in numbered directories below the level from which you call the scripts. See example directory structure below:

├── 1
│   ├── kent1_eddy.nii.gz
│   ├── mask_mask.nii.gz
│   └── mask.nii.gz
├── 2
│   ├── kent2_eddy.nii.gz
│   ├── mask_mask.nii.gz
│   └── mask.nii.gz
├── 3
│   ├── kent3_eddy.nii.gz
│   ├── mask_mask.nii.gz
│   └── mask.nii.gz
├── bvals.1D
├── bvecs.1D
├── kent
│   │   ├── Subject1
│   │   ├── AMICO
│   │   │   └── NODDI
│   │   │       ├── config.pickle
│   │   │       ├── FIT_dir.nii.gz
│   │   │       ├── FIT_ICVF.nii.gz
│   │   │       ├── FIT_ISOVF.nii.gz
│   │   │       └── FIT_OD.nii.gz
│   │   ├── brain_mask.hdr
│   │   ├── brain_mask.img
│   │   ├── NODDI_DWI.hdr
│   │   ├── NODDI_DWI.img
│   │   ├── NODDI_protocol.bval
│   │   ├── NODDI_protocol.bvec
│   │   ├── NODDI_protocol.scheme
│   │   ├── roi_mask.hdr
│   │   └── roi_mask.img
│   ├── Subject2
│   │   ├── brain_mask.hdr
│   │   ├── brain_mask.img
│   │   ├── NODDI_DWI.hdr
│   │   ├── NODDI_DWI.img
│   │   ├── NODDI_protocol.bval
│   │   ├── NODDI_protocol.bvec
│   │   ├── NODDI_protocol.scheme
│   │   ├── roi_mask.hdr
│   │   └── roi_mask.img
│   ├── Subject3
│   │   ├── brain_mask.hdr
│   │   ├── brain_mask.img
│   │   ├── NODDI_DWI.hdr
│   │   ├── NODDI_DWI.img
│   │   ├── NODDI_protocol.bval
│   │   ├── NODDI_protocol.bvec
│   │   ├── NODDI_protocol.scheme
│   │   ├── roi_mask.hdr
│   │   └── roi_mask.img
|------------------------------

33 directories, 291 files
