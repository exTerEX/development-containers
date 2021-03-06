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

ENV GO111MODULE on

ENV DEBIAN_FRONTEND noninteractive

RUN sudo apt update \
    && sudo apt --assume-yes install --no-install-recommends \
    golang \
    && go get golang.org/x/tools/gopls@latest

WORKDIR /tmp/
RUN git clone https://github.com/go-delve/delve \
    && cd delve \
    && go install github.com/go-delve/delve/cmd/dlv \
    && sudo rm -rf /tmp/delve

RUN sudo rm -rf /var/lib/apt/lists/*

ENV DEBIAN_FRONTEND dialog

CMD [ "bash" ]
