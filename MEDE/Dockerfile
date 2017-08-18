FROM idies

EXPOSE 8888

RUN yum -y install wget bzip2 git
RUN yum -y install libXext-devel libSM-devel libXrender-devel xorg-x11-server-Xvfb

USER idies
RUN cd /home/idies && wget https://repo.continuum.io/archive/Anaconda3-4.4.0-Linux-x86_64.sh
RUN cd /home/idies && bash Anaconda3-4.4.0-Linux-x86_64.sh -b
RUN rm /home/idies/Anaconda3-4.4.0-Linux-x86_64.sh

ENV PATH /home/idies/anaconda3/bin:$PATH
ENV DISPLAY=:1

RUN conda create --name py27 python=2.7 anaconda

RUN conda update --all
RUN conda update --name py27 --all

RUN ipython kernel install --user
RUN source activate py27 && ipython kernel install --user

RUN conda clean --all #might need to move this to the bottom TODO

RUN ipython profile create
#David notes that ipython kernel config is deprecated, new file called jupyter_notebook_config.
#can use it to open to mede container directory, add in paths, extensions, etc. TODO
RUN printf "\nc.InteractiveShellApp.matplotlib = 'inline'\n" >> /home/idies/.ipython/profile_default/ipython_kernel_config.py

USER root

ADD startup.sh /opt/
RUN chmod a+x /opt/startup.sh

# SciScript-Python

USER idies

RUN cd /home/idies && git clone https://github.com/sciserver/SciScript-Python.git
RUN source activate py27 && pip install grequests
RUN pip install grequests
RUN touch /home/idies/keystone.token
RUN cd /home/idies/SciScript-Python && python Install.py
RUN rm -f /home/idies/keystone.token

RUN cd /home/idies/workspace && wget https://raw.githubusercontent.com/sciserver/Example-Notebooks/readme/StartHere.ipynb

#clone David's example notebooks for MEDE
#commented out statement below because itd be bad practice to clone into local workspace dir. We want users to work within persistent, not within local VM diskspace
RUN cd /home/idies/workspace && git clone https://github.com/davidelbert/mede_example_notebooks_public.git

#this if statement failed in the dockerfile - persistent directory did not yet exist - reverting to workspace directory for now TODO
#RUN cd /home/idies/workspace/persistent && if cd mede_example_notebooks_public; then git pull; else git clone https://github.com/davidelbert/mede_example_notebooks_public.git; fi

# not sure the above bash script will work in sh dockerfile..

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
