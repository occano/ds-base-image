FROM arm32v7/python:3.6-buster

ENV CPATH="/usr/include/hdf5/serial/"
ENV PYTHONPATH="/usr/lib/python3/dist-packages"

RUN apt-get update && apt-get upgrade -y

RUN echo "[global]" >> /etc/pip.conf
RUN echo "extra-index-url=https://www.piwheels.org/simple" >> /etc/pip.conf

RUN apt-get install -y gcc gfortran libatlas-base-dev python-dev libopenblas-dev liblapack-dev 
RUN apt-get install -y cython libhdf5-dev
RUN pip3 install tensorflow
CMD ["/bin/bash"]
EXPOSE 5001
