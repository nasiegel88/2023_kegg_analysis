# 2023_kegg_analysis

## Setup
If you dont already have Git installed you will be to do so. Follow the directions below to set up Git on your computer:

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

All the necessary packages are located in `environment.yml`. This environment file will be used with Docker to create work space image to run the analysis. We are arn't going to interact directly with Docker. Instead we are going to use a package called `repo2docker` to create a "virtual computer" with all of our desired packages. To do this you first need to install `repo2docker`:

```bash
# This will create an environment called `repo2docker` install the package `jupyter-repo2docker`
mamba create -n repo2docker -c conda-forge jupyter-repo2docker
```

Once `jupyter-repo2docker` is installed in your environment you will be able to activate it with `mamba activate repo2docker`. Once activated the environment file mentioned earlier can now be used to create an image that will have all the necessary packages to run the Kegg analysis.