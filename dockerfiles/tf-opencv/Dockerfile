FROM tensorflow/tensorflow:2.3.1-gpu-jupyter

LABEL maintainer="l-boisson"

# General dependencies
RUN add-apt-repository "deb http://security.ubuntu.com/ubuntu xenial-security main"
RUN apt update
RUN apt-get install -y \
        build-essential \
        cmake \
        git \
        wget \
        unzip \
        yasm \
        libgtk2.0-dev \
        pkg-config \
        libswscale-dev \
        libtbb2 \
        libtbb-dev \
        libjpeg-dev \
        libpng-dev \
        libtiff-dev \
        libjasper-dev \
        libavcodec-dev \
        libavformat-dev \
        libhdf5-dev \
        libpq-dev \
        libdc1394-22-dev

# Update pip
RUN python3 -m pip --no-cache-dir install --upgrade pip

# Python dependencies
RUN pip3 --no-cache-dir install \
    numpy \
    hdf5storage \
    h5py \
    py3nvml

# OpenCV wth contribs
WORKDIR /
ENV OPENCV_VERSION="4.5.0"
RUN wget -O opencv.zip https://github.com/opencv/opencv/archive/${OPENCV_VERSION}.zip \
&& wget -O opencv_contrib.zip https://github.com/opencv/opencv_contrib/archive/${OPENCV_VERSION}.zip \
&& unzip opencv.zip \
&& unzip opencv_contrib.zip \
&& mkdir /opencv-${OPENCV_VERSION}/cmake_binary \
&& cd /opencv-${OPENCV_VERSION}/cmake_binary \
&& cmake \
  -DOPENCV_EXTRA_MODULES_PATH=/opencv_contrib-${OPENCV_VERSION}/modules \
  -DBUILD_TIFF=ON \
  -DBUILD_opencv_java=OFF \
  -DWITH_CUDA=OFF \
  -DENABLE_AVX=ON \
  -DWITH_OPENGL=ON \
  -DWITH_OPENCL=ON \
  -DWITH_IPP=ON \
  -DWITH_TBB=ON \
  -DWITH_EIGEN=ON \
  -DWITH_V4L=ON \
  -DBUILD_TESTS=OFF \
  -DBUILD_PERF_TESTS=OFF \
  -DCMAKE_BUILD_TYPE=RELEASE \
  -DCMAKE_INSTALL_PREFIX=$(python3 -c "import sys; print(sys.prefix)") \
  -DPYTHON_EXECUTABLE=$(which python3) \
  -DPYTHON_INCLUDE_DIR=$(python3 -c "from distutils.sysconfig import get_python_inc; print(get_python_inc())") \
  -DPYTHON_PACKAGES_PATH=$(python3 -c "from distutils.sysconfig import get_python_lib; print(get_python_lib())") .. \
&& make -j `nproc` \
&& make install \
&& rm /opencv.zip \
&& rm /opencv_contrib.zip \
&& rm -r /opencv-${OPENCV_VERSION} \
&& rm -r /opencv_contrib-${OPENCV_VERSION}


# Computer vision related python modules
RUN python3 -m pip --no-cache-dir install \
    scikit-learn \
    scipy \
    pandas \
    Pillow \
    tensorflow-addons \
    mlflow \
    seaborn \
    jupyterlab \
    jupytext

# Install jupytext and prepare extension to synchronize jupyter notebooks to py files for better git versionning
# note : nodejs is necessary for this
RUN wget -qO- https://deb.nodesource.com/setup_14.x | bash -
RUN apt install -y nodejs 
RUN jupyter lab build


# Install Qt5 matplotlib backend and dependencies
RUN python3 -m pip --no-cache-dir install PyQt5
RUN apt install -y \
    mesa-utils \
    libxcb1-dev \
    libxcb-xinerama0-dev \
    libxkbcommon-dev \
    libxkbcommon-x11-dev \
    libxcb-icccm4-dev \
    libxcb-image0-dev \
    libxcb-keysyms1-dev \
    libxcb-randr0-dev \
    libxcb-render0-dev \
    libxcb-shape0-dev \
    libxcb-render-util0-dev

#USER cv
# WORKDIR /home/cv
#ENV HOME /home/cv/