FROM ubuntu:20.04

ARG USERNAME=vscode
ARG UID=1000
ARG GID=${UID}

ENV HOME /home/${USERNAME}

ENV DEBIAN_FRONTEND noninteractive

RUN apt update \
    && apt --assume-yes install --no-install-recommends \
    apt-utils \
    software-properties-common \
    ca-certificates \
    curl

RUN apt --assume-yes install --no-install-recommends locales \
    && echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen \
    && locale-gen en_US.utf8 \
    && /usr/sbin/update-locale LANG=en_US.UTF-8

# TODO: Possibly more, check jekyll image
ENV LC_ALL en_US.UTF-8
ENV LANG en_US.UTF-8

RUN apt --assume-yes install --no-install-recommends sudo \
    && groupadd --gid ${GID} ${USERNAME} \
    && useradd -s /bin/bash --uid ${UID} --gid ${GID} -m ${USERNAME} \
    && echo ${USERNAME} ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/${USERNAME} \
    && chmod 0440 /etc/sudoers.d/${USERNAME} \
    && chown ${USERNAME}:${USERNAME} ${HOME}

RUN sudo apt --assume-yes install --no-install-recommends \
    git \
    openssh-client \
    gnupg2

RUN sudo rm -rf /var/lib/apt/lists/* \
    && curl -fsSL https://raw.github.com/ohmybash/oh-my-bash/master/tools/install.sh | bash || true \
    && chmod --recursive 0500 ${HOME}/.oh-my-bash \
    && chown --recursive ${USERNAME}:${USERNAME} ${HOME}/.oh-my-bash \
    && rm ~/.bashrc.pre-oh-my-bash

ENV DEBIAN_FRONTEND dialog

USER ${USERNAME}:${USERNAME}

COPY --chown=${USERNAME}:${USERNAME} dotfiles ${HOME}

RUN sudo rmdir /srv

CMD [ "bash" ]