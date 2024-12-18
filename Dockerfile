FROM jasonbelt/microkit_domain_scheduling:latest

RUN apt-get update && apt-get install -y vim wget

RUN curl -sSf https://sh.rustup.rs | \
        bash -s -- -y --no-modify-path \
            --default-toolchain nightly-2024-09-01 \
            --component rust-src llvm-tools rust-analyzer rustc-dev \
            --target x86_64-unknown-linux-musl

RUN cd ~ && wget https://github.com/dornerworks/microkit/releases/download/inspecta-v1.0/microkit-sdk-1.4.1-inspecta-v1.0.tar.gz && \
  tar -xzf microkit-sdk-1.4.1-inspecta-v1.0.tar.gz && \
  rm -rf microkit-sdk-1.4.1-inspecta-v1.0.tar.gz microkit && \
  mv microkit-sdk-1.4.1 microkit
  

ENV MICROKIT_BOARD=zcu102
ENV MICROKIT_SDK=/root/microkit/

