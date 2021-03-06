# Copyright 2021 Andreas Sagen
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

FROM ubuntu:20.04

ARG USERNAME=vscode
ARG UID=1000
ARG GID=${UID}

ENV HOME /home/${USERNAME}
ENV PATH /usr/local/bin:$PATH:${HOME}/.local/bin
ENV TZ UTC

RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime \
    && echo $TZ > /etc/timezone

ENV DEBIAN_FRONTEND noninteractive

RUN apt update \
    && apt --assume-yes install --no-install-recommends \
    apt-utils \
    ca-certificates \
    curl \
    make

RUN apt --assume-yes install --no-install-recommends locales \
    && echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen \
    && locale-gen en_US.utf8 \
    && /usr/sbin/update-locale LANG=en_US.UTF-8

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
