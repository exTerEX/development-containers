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

ENV DEBIAN_FRONTEND noninteractive

RUN sudo add-apt-repository --enable-source --yes "ppa:marutter/rrutter4.0" \
    && sudo add-apt-repository --enable-source --yes "ppa:c2d4u.team/c2d4u4.0+" \
    && sudo apt update \
    && sudo apt --assume-yes install --no-install-recommends \
    r-base \
    r-recommended \
    r-cran-formatr\
    r-cran-rmarkdown \
    r-cran-knitr \
    r-cran-tinytex \
    r-cran-tikzdevice \
    r-cran-highr \
    r-cran-rcurl

RUN sudo apt --assume-yes install --no-install-recommends \
    littler

RUN sudo ln -s /usr/lib/R/site-library/littler/examples/install.r /usr/local/bin/install.r \
    && sudo ln -s /usr/lib/R/site-library/littler/examples/install2.r /usr/local/bin/install2.r \
    && sudo ln -s /usr/lib/R/site-library/littler/examples/installGithub.r /usr/local/bin/installGithub.r \
    && sudo ln -s /usr/lib/R/site-library/littler/examples/testInstalled.r /usr/local/bin/testInstalled.r

RUN sudo install.r docopt \
    && sudo rm -rf /tmp/downloaded_packages/ /tmp/*.rds \
    && sudo rm -rf /var/lib/apt/lists/*

ENV DEBIAN_FRONTEND dialog

CMD [ "bash" ]
