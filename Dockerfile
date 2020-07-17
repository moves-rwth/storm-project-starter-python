FROM movesrwth/stormpy:1.6.0
MAINTAINER Matthias Volk <matthias.volk@cs.rwth-aachen.de>


##########
# Create user
##########

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
# Install dependencies
##########

RUN pip install --no-cache-dir notebook==5.7.9
RUN pip install --no-cache-dir rise==5.6.1
RUN pip install --no-cache-dir jupyter_contrib_nbextensions==0.5.1
RUN pip install --no-cache-dir hide_code==0.5.5

RUN jupyter nbextension enable --py rise
RUN jupyter contrib nbextension install --user
RUN jupyter nbextension enable splitcell/splitcell
RUN jupyter nbextension install --py hide_code --user
RUN jupyter nbextension enable --py hide_code
RUN jupyter serverextension enable --py hide_code

# Install python libraries
RUN pip install --no-cache-dir matplotlib==3.2.1


##########
# Copy files for notebooks
##########

# tests
RUN mkdir notebooks
COPY /stormpy_starter notebooks/stormpy_starter
COPY /examples notebooks/examples
COPY *.ipynb notebooks/

