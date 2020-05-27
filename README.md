# Admixture_scripts
scripts to convert to ped format from vcf and quality of life script to run admixture

You need a filtered vcf file to do the conversion and download plink from here: https://www.cog-genomics.org/plink2 (version 1.9 stable). Then make a symbolic link for plink to the environment path (sudo ln -s /path/to/plink /usr/local/bin , make sure that the paths are absolute and not relative!) and make sure that plink has executive rights (sudo chmod +x /path/to/plink). The conversion script is run using python3. to run it type in the terminal: python3 /path/to/convertVcf2.py -i /path/to/myOrganism.vcf -o /path/to/myOrganism
Note that there should be no ending on the output file (-o).

To use the admixture script, it is required to have admixture in the environment path, download from: http://software.genetics.ucla.edu/admixture/download.html and create symbolic link like above (and set the executive rights). Then use the script like this: /path/to/admixture.sh myOrganism.ped outputfolderName maxK NrThreads. First is name or path to your ped file, second is the name of the folder where it will output the results and the third is the number of threads to use and the last is the max nr of K to which to analyse.

The Rscript should be opened in Rstudio (or whatever R editor you use) and be edited in accordance to your need (change file paths etc.)
