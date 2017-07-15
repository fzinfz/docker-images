source activate py27 && \
    curl -sL https://deb.nodesource.com/setup_6.x |bash - && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y nodejs && \
    source deactivate py27
    
npm install --unsafe-perm -g ijavascript && \
    ijs --ijs-install=local && \
    jupyter-kernelspec install /root/.local/share/jupyter/kernels/javascript
    
mkdir /data
cd /data

npm install -g create-react-native-app && create-react-native-app ReactNativeSampleApp    
