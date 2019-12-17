FROM arm32v7/python:3.7.5-buster

ENV CPATH="/usr/include/hdf5/serial/"
ENV PYTHONPATH="/usr/lib/python3/dist-packages"

RUN apt-get update && apt-get upgrade -y

RUN echo "[global]" >> /etc/pip.conf			&& \
    echo "extra-index-url=https://www.piwheels.org/simple" >> /etc/pip.conf

RUN apt-get install -y gcc gfortran libatlas-base-dev python-dev libopenblas-dev liblapack-dev 
RUN apt-get install -y cython libhdf5-dev
RUN pip install tensorflow
RUN pip install keras

RUN pip install --user Tempita pybind11

RUN git clone https://github.com/scipy/scipy.git /usr/src/scipy && \
    cd /usr/src/scipy						&& \ 
    python setup.py install					&& \
rm -rf /usr/src/scipy
RUN apt install -y libblas-dev llvm libsndfile1-dev
RUN pip install llvmlite
RUN pip install Cython
RUN pip install librosa
RUN pip install scikit-learn

CMD ["/bin/bash"]
