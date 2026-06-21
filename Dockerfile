FROM mambaorg/micromamba:ubuntu22.04

ENV QUARTO_VERSION=1.7.31
ENV PYTHON_VERSION=3.12
ENV ENV_NAME=juliacon26

#################### Phase1 Root User Operations
# Here we do not automatically activate the mamba environment 
ARG MAMBA_DOCKERFILE_ACTIVATE=0
SHELL ["/bin/bash", "-c"]
USER root

# Adding a non-root user
# https://code.visualstudio.com/remote/advancedcontainers/add-nonroot-user#_creating-a-nonroot-user
ARG USERNAME=dev
ARG USER_UID=1000
ARG USER_GID=$USER_UID
# Add group and add the user to the group
# RUN groupadd --gid $USER_GID $USERNAME \
#     && useradd --uid $USER_UID --gid $USER_GID -m $USERNAME


# Changing Default Mamba User
# https://micromamba-docker.readthedocs.io/en/latest/advanced_usage.html#changing-the-user-id-or-name
RUN usermod "--login=${USERNAME}" "--home=/home/${USERNAME}" \
        --move-home "-u ${USER_UID}" "${MAMBA_USER}" && \
    groupmod "--new-name=${USERNAME}" \
        "-g ${USER_GID}" "${MAMBA_USER}" && \
    # Update the expected value of MAMBA_USER for the
    # _entrypoint.sh consistency check.
    echo "${USERNAME}" > "/etc/arg_mamba_user" && \
    :
ENV MAMBA_USER=$USERNAME

# Install non-mamba dependencies from apt
RUN apt-get update && apt-get install -y vim git wget bzip2 libfontconfig1 fontconfig librsvg2-dev librsvg2-bin \
&& apt-get clean \
&& rm -rf /var/lib/apt /tmp/* /var/tmp/* /var/lib/dpkg /var/lib/cache /var/lib/log

# Install Quarto directly into container
RUN wget https://github.com/quarto-dev/quarto-cli/releases/download/v${QUARTO_VERSION}/quarto-${QUARTO_VERSION}-linux-amd64.tar.gz \
&& tar -C /opt -xvzf quarto-${QUARTO_VERSION}-linux-amd64.tar.gz \
&& ln -s /opt/quarto-${QUARTO_VERSION}/bin/quarto /usr/local/bin/quarto \
&& rm quarto-${QUARTO_VERSION}-linux-amd64.tar.gz \
&& quarto -v

# Copy the environment file to the container
COPY environment.yml /tmp/environment.yml

# Replace the version numbers in the environment file
RUN sed -ix s@PYTHON_VERSION@"$PYTHON_VERSION"@g /tmp/environment.yml && \
    sed -ix s@ENV_NAME@"$ENV_NAME"@g /tmp/environment.yml


#################### Phase2 User Operations

# Set the default user to the non-root user, since no more root operations are needed
USER $USERNAME
# Install tinytex using quarto in a non-root user directory, otherwise it will be installed in `/root/.TinyTeX`
# which is not accessible by the non-root user.
RUN quarto install tinytex \
    && ~/.TinyTeX/bin/*/tlmgr update --self

# Create and install the environment
RUN micromamba create -n ${ENV_NAME} && \
    micromamba install -y -n $ENV_NAME -f /tmp/environment.yml && \
    micromamba clean --all --yes

# Finally set automatic activation of the mamba environment
ARG MAMBA_DOCKERFILE_ACTIVATE=1


# Check quarto installation and install tinytex
RUN quarto check 
RUN rsvg-convert --version



