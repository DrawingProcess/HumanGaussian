FROM nvidia/cuda:11.8.0-devel-ubuntu22.04

# 필요한 패키지 설치
RUN apt-get update && \
    apt-get install -y python3 python3-pip git && \
    rm -rf /var/lib/apt/lists/*

# PyTorch 및 의존성 설치
RUN pip install torch==2.1.0 torchvision==0.16.0 torchaudio==2.1.0 xformers --index-url https://download.pytorch.org/whl/cu118

# Working directory 설정
WORKDIR /HumanGaussian

# requirements.txt를 복사하고 설치
COPY requirements.txt ./
# RUN pip install -r requirements.txt

# RUN git clone --recursive https://github.com/ashawkey/diff-gaussian-rasterization
# RUN pip install ./diff-gaussian-rasterization
# RUN pip install ./gaussiansplatting/submodules/simple-knn


RUN apt-get update && apt-get install ffmpeg libsm6 libxext6 python-is-python3  -y

# 마지막으로 Bash 실행
CMD ["/bin/bash"]
