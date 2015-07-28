H<sub>2</sub>S-FeS<sub>2</sub>-TPD
============

This is a simple Fortran program for simulating temperature programmed desorption of H<sub>2</sub>S molecules from the (100) surface of pyrite, FeS<sub>2</sub>. This script is supplementary information for the journal article **Quantifying the origin of inter-adsorbate interactions on reactive surfaces for catalyst screening and design**, *Physical Chemistry Chemical Physics* (2015). DOI: [10.1039/C5CP03143E](http://dx.doi.org/10.1039/C5CP03143E)


Installing and Running
-------

Compile using gfortran or ifort (or any other fortran compiler of your choice). Do either `gfortran -o tpd.exe tpd_integrate.f90` or `ifort -o tpd.exe tpd_integrate.f90`

Run the program using `./tpd.exe`


Output and Visualization
----------------------

The program produces an output file named h2s-tpd.data. 

This output file can be visualized using the script in the **utils** folder. To use the script, navigate to the **utils** folder and run `gnuplot h2s-tpd.gnuplt`. The output of the script is a postscript file named `H2S-TPD.eps`
