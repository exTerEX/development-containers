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

FROM base

ENV LANG C.UTF-8

ENV DEBIAN_FRONTEND noninteractive

RUN sudo apt update \
    && sudo apt --assume-yes install --no-install-recommends \
    python3 \
    python3-dev \
    python3-setuptools \
    python3-pip

RUN sudo update-alternatives --install /usr/local/bin/python python /usr/bin/python3 1 \
    && sudo update-alternatives --install /usr/local/bin/pip pip /usr/bin/pip3 1

ENV DEBIAN_FRONTEND dialog

CMD [ "bash" ]
