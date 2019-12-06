FROM ubuntu:latest

RUN mkdir ./app
WORKDIR ./app

RUN apt-get update && apt-get install -y wget curl git unzip unrar build-essential python3 python3-pip graphviz-dev libsndfile1

# Clean up
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

# Install Anaconda
RUN echo 'export PATH=/opt/conda/bin:$PATH' > /etc/profile.d/conda.sh
RUN wget --quiet https://repo.anaconda.com/archive/Anaconda3-2018.12-Linux-x86_64.sh -O ~/anaconda.sh
RUN /bin/bash ~/anaconda.sh -b -p /opt/conda
RUN rm ~/anaconda.sh
# Set path to conda
ENV PATH /opt/conda/bin:$PATH
# Update Anaconda
RUN conda update conda && conda update anaconda && conda update --all


RUN curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
RUN python3 get-pip.py

RUN conda install -c conda-forge keras tensorflow

# In your environment run:
RUN pip3 install -U rasa_core==0.14.5 rasa_nlu[spacy]===0.15.1;
RUN pip install soundfile
RUN pip install librosa

# # Install Jupyter theme
# RUN pip install msgpack jupyterthemes
# RUN jt -t grade3
# # Install other Python packages
# RUN conda install pymssql
# RUN pip install SQLAlchemy \
#     missingno \
#     json_tricks \
#     bcolz \
#     gensim \
#     elasticsearch \
#     psycopg2-binary
