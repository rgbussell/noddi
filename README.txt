# NODDI procesing and analysis pipeline

## This repo: A containerized version of AMICO/NODDI, an MRI image analysis method for estimating the angular dispersion of cells in brain tissue, among other things.

This repo contains a more user-friendly implementation that wraps all code dependencies into a container. Those include non-standard Python libraries, linear algebra libraries in C, the NODDI code itself, and other things. Because this installation is encoded in the docker container, you do not have to do this yourself.

The code should run on linux systems and Mac OSX that have docker installed and running.

##The core NODDI code in this repo is from D'Adduci, et.al.:

*Accelerated Microstructure Imaging via Convex Optimization (AMICO) from diffusion MRI data
Alessandro Daducci, Erick J.Canales-Rodríguez, HuiZhang, Tim B.Dyrby, Daniel C.Alexander, Jean-Philippe Thiran
https://doi.org/10.1016/j.neuroimage.2014.10.026*


Contact: rgbussell@gmail.com
