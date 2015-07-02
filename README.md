H<sub>2</sub>S-FeS<sub>2</sub>-TPD
============

This is a simple Fortran program for simulating temperature programmed desorption of H<sub>2</sub>S molecules from the (100) surface of pyrite, FeS<sub>2</sub>.


Installing and Running
-------

Compile using gfortran or ifort (or any other fortran compiler of your choice). Do either `gfortran -o tpd.exe tpd_integrate.f90` or `ifort -o tpd.exe tpd_integrate.f90`

Run the program by typing `./tpd.exe`


Output and Visualization
----------------------

The program produces an output file named h2s-tpd.data. 

This output file can be visualized using the script in the **utils** folder. To use the script, navigate to the **utils** folder and run `gnuplot h2s-tpd.gnuplt`. The output of the script is a postscript file named `H2S-TPD.eps`
