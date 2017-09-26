FROM python

#remove non-mede related 'starthere.ipynb' to avoid confusion

RUN rm /home/idies/workspace/StartHere.ipynb

#Install mantid + dependencies for mantid
USER idies
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
RUN source activate py27 && conda install --channel matsci pymatgen

#replace startup.sh in /opt/ added by python image dockerfile
USER root
ADD startup.sh /opt/
RUN chmod a+x /opt/startup.sh

#last statement must be USER root
USER root
