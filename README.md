# genesis_app
DNA Nexus App for analysis based on the R GENESIS package

There directories in the repository are as follows:

- R:  Contains all the R files. The files are moved to the HOME directory in the cloud instance
- setup/cloud : Contains the files that are used for setting up the cloud instance, these files
are moved to the HOME directory in the cloud instance
- setup/local : Auxiliary scripts for setting up the DNA NEXUS project directory
- app/ : The dna nexus app files these were initially generated by the dx-app-wizard

The Makefile can generate the dna nexus app directory just run:
``` 
make
```
The above creates the dna nexus directory and downloads the necessary archives.
If the directory/files already exists it will update the archives only if they
have changed compared to the setup/local/archives.md5 file.

If you update the archives in the dna nexus project directory you can use:

``` 
make update_archive_md5sum 
```

To update the setup/local/archives.md5



