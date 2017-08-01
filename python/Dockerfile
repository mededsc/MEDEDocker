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

RUN conda clean --all

RUN ipython profile create
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

USER root
