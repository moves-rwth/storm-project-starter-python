# Run Docker container for Jupyter notebook
###################################
# The Docker image can be built by executing:
# docker build -t yourusername/stormpy-starter .
# A different stormpy base image can be set from the commandline with:
# --build-arg STORMPY_BASE=<new_base_image>

# Set stormpy base image
ARG STORMPY_BASE=movesrwth/stormpy:stable
FROM $STORMPY_BASE
LABEL org.opencontainers.image.authors="dev@stormchecker.org"


##########
# Create user
##########

# Ubuntu 24.04 comes with 'ubuntu' user at id 1000
# Change it to 1001 to free up 1000 for the binder user
RUN usermod -u 1001 ubuntu
RUN groupmod -g 1001 ubuntu
ARG NB_USER=jovyan
ARG NB_UID=1000
ENV USER ${NB_USER}
ENV NB_UID ${NB_UID}
ENV HOME /home/${NB_USER}

RUN adduser --disabled-password \
    --gecos "Default user" \
    --uid ${NB_UID} \
    ${NB_USER}

# Change the owner of the virtual environment
WORKDIR /opt
USER root
RUN chown -R ${NB_UID} venv
USER ${NB_USER}

WORKDIR ${HOME}
# Add missing path
ENV PATH="$HOME/.local/bin:$PATH"


##########
# Install Jupyterlab
##########

RUN python3 -m pip install --no-cache-dir notebook jupyterlab

##########
# Copy files for notebooks
##########

COPY . ${HOME}
# Change owner of files
USER root
RUN chown -R ${NB_UID} ${HOME}
USER ${NB_USER}
