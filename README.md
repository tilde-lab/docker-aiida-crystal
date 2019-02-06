# Brief summary

This is a docker-compose setup for *CRYSTAL* code to have three containers:

- aiida: AiiDA (using Django backend), connected to 

- db: a postgres DB, 
  
and with ssh keys preconfigured to connect to 

- torquessh: a machine with both openmpi and PBS/torque sheduler installed; the user aiida on container
  aiida can connect already passwordless to app@torquessh. 
  
# How to start everything

*CRYSTAL* is a commercial code, so to comply with the license terms it is not distributed within the repository. 
Before starting working with the containers, `crystal` and `Pcrystal` executable files must be placed in `torquessh/code` 
directory. After that, run the script `startup_firsttime.sh` (only once), that will also
generate ssh keys and passwords, start the services, and setup AiiDA.

When starting for the second and subsequent times (while changing anything in `Dockerfile`s), run `startup.sh`.

The three services are run in the background and you can list them with

`docker-compose ps`

(all `docker-compose` commands must be run from within the folder or one
of its subfolders).

# Data persistence

The following data is persistent:

- volume "dbdata": all DB data (tables, etc.) from postgres
- volume "aiidalogs": the .aiida folder
- volume "aiidarepo": the AiiDA file repository
- folder ~/.ssh/keys, mounted from the host folder init/sshkeys/sharedfolder,
  created in step 1 (actually this is needed only at the first start)

`verdi` script is needed to run `verdi` commands inside the container, for instance:
```shell
 >> ./verdi calculation list
```

# To shutdown everything

Use `docker-compose down`. Note that this will keep the data.

If you want to kill also the data (i.e. the named data volumes), use
`docker-compose down -v`

# Known bugs

Presently, there are one known bug:

`torquessh` node has 1 processor by default, that prohibits testing `Pcrystal` code. Please run 
```
   docker-compose exec --user root torquessh "qmgr set node torquessh np=2" 
```   
after the containers have beed started.
