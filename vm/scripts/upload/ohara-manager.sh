#!/bin/bash
#
# Copyright 2019 is-land
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

source ./ohara-env.sh

container_name="ohara-manager"

if [ ! "$(docker ps -q -f name=$container_name)" ]; then
  echo -e "\n> Start ohara-manager..."

  docker run --name $container_name --restart=always \
    -p $MANAGER_PORT:$MANAGER_PORT \
    -d "oharastream/manager:$OHARA_VER" \
    --port $MANAGER_PORT \
    --configurator $CONFIGURATOR_API
fi
