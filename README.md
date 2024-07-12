# storm-project-starter-python
Starter project for the Python API of Storm via Stormpy

[![Binder](https://mybinder.org/badge_logo.svg)](https://mybinder.org/v2/gh/moves-rwth/storm-project-starter-python/master?filepath=stormpy_starter.ipynb)

## Getting started
Before starting, make sure that Storm and stormpy are installed. If not, see the [documentation](https://moves-rwth.github.io/stormpy/installation.html) for details on how to install stormpy.

First, install the Python package. If you use a virtual environment, make sure to use it.
To install the starter package, execute
```
python setup.py develop
```

Then, run the script using 
```
python stormpy_starter/check.py --model examples/die.pm --property examples/die.pctl
```
The answer should be no.

Then, run the script using 
```
python stormpy_starter/check.py --model examples/die.pm --property examples/die2.pctl
```
The answer should be yes.

## Try out in browser via Jupyterlab
You can also try out the starter project in your browser by using Jupyterlab.

You can use this [Binder link](https://mybinder.org/v2/gh/moves-rwth/storm-project-starter-python/master?filepath=stormpy_starter.ipynb) which starts an interactive Jupyter notebook.

### Running Jupyter locally.
You can also start the Jupyterlab locally using [Docker](https://www.docker.com/).
First, build the Docker container with
```
docker build -t movesrwth/stormpy-starter .
```
Then start the Docker container with the following command:
```
docker run -it --rm -p 8888:8888 movesrwth/stormpy-starter jupyter notebook --NotebookApp.default_url=/lab/ --ip=0.0.0.0 --port=8888
```
You can find the URL to the notebook in the output.

## What is next?
You are all set to implement your own tools and algorithms on top of stormpy.
Feel free to contribute your new algorithms to stormpy, such that others can enjoy them.
