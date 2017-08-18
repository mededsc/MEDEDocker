FROM python

USER idies

#clone David's example notebooks for MEDE
#commented out statement below because itd be bad practice to clone into local workspace dir. We want users to work within persistent, not within local VM diskspace
RUN cd /home/idies/workspace && git clone https://github.com/davidelbert/mede_example_notebooks_public.git

#this if statement failed in the dockerfile - persistent directory did not yet exist - reverting to workspace directory for now TODO
#RUN cd /home/idies/workspace/persistent && if cd mede_example_notebooks_public; then git pull; else git clone https://github.com/davidelbert/mede_example_notebooks_public.git; fi


#Install mantid + dependencies for mantid

RUN source activate py27 && conda install -c asmeurer gsl=1.16
RUN conda config --add channels conda-forge
#supposed fix to the conda-forge 403 error
RUN anaconda logout
RUN source activate py27 && conda install -c conda-forge jsoncpp=0.10.6
RUN source activate py27 && conda install -c conda-forge muparser=2.2.5
RUN source activate py27 && conda install -c conda-forge hdf5
RUN source activate py27 && conda install -c auto python-nexus=0.87
RUN source activate py27 && conda install -c https://conda.anaconda.org/nexpy nexusformat
RUN source activate py27 && conda install -c glotzer tbb=4.4.0
RUN source activate py27 && conda install -c conda-forge libglu=9.0.0

RUN source activate py27 && conda install -c mantid mantid-framework=3.10.0

#Install pymatgen

RUN conda install --channel matsci pymatgen


USER root
