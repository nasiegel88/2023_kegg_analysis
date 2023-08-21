# 2023_kegg_analysis

## Setup
If you don't already have Git installed, you will be to do so. Follow the directions below to set up Git on your computer:

```bash
# Assuming you are using Linux install Git with this command
sudo apt-get update
sudo apt-get install git
```

```bash
git config --global user.name "Username"
git config --global user.email "email@email.com"
```

```bash
# Clone the repo
git clone git@github.com:nasiegel88/2023_kegg_analysis.git
```

```bash
# Change to the repo directory
cd 2023_kegg_analysis
```

Take a look at the directory contents
```bash
ls # Will list all the files in the directory
```

All the necessary packages are located in `environment.yml`. This environment file will be used with Docker to create a workspace image to run the analysis. We aren't going to interact directly with Docker. Instead, we will use a package called `repo2docker` to create a "virtual computer" with all our desired packages. To do this, you first need to install `repo2docker`:

```bash
# This will create an environment called `repo2docker` install the package `jupyter-repo2docker`
mamba create -n repo2docker -c conda-forge jupyter-repo2docker
```

Once `jupyter-repo2docker` is installed in your environment, you can activate it with `mamba activate repo2docker`. Once activated, the environment file mentioned earlier can be used to create an image with all the necessary packages to run the Kegg analysis.

With the `repo2docker` environment activated, you are ready to build the Docker image we will use to run the analysis.
```bash
jupyter-repo2docker . # Remember the period!
```

If you see an error message resembling `PermissionError: [Errno 13] Permission denied: '/home/noah/start'`, the message indicates that the shell script to export the library path is not executable. This be fixed by running `chmod u+x start`. After running that command, try creating the workspace image gain.

Next, we will move to the Rmarkdown document to practice using `KEGGREST`. [Open analysis.Rmd](analysis.Rmd).