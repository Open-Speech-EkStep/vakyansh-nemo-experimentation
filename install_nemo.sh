sudo apt-get install -y libsndfile1 ffmpeg sox
pip install Cython
pip install nemo_toolkit['all']
pip uninstall numpy
pip uninstall pesq
pip install numpy==1.21.1
pip install pesq --no-binary pesq sox
sudo apt-get install swig
