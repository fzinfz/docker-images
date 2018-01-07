FROM jupyter/scipy-notebook

RUN pip install tensorflow tensorflow-gpu

# https://github.com/BVLC/caffe/tree/opencl
RUN conda config --add channels conda-forge && \
    conda config --add channels willyd && \
    conda install --yes \
        cmake ninja numpy scipy protobuf==3.1.0 six scikit-image pyyaml pydotplus graphviz

RUN pip install keras scikit-learn \
 && fix-permissions $CONDA_DIR