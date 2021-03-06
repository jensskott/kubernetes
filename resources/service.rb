#
# Copyright:: Copyright (c) 2015 Chef Software, Inc.
# License:: Apache License, Version 2.0
# Authors:  Andre Elizondo (andre@chef.io)
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

actions :create, :destroy
default_action :create

provides :kube_service

# how kubernetes will identify the service
attribute :id, name_attribute: true, kind_of: String

# the port that the service will be listening on
attribute :port, required: true, kind_of: Fixnum

# the internal port that kubernetes will route from the service to the container
attribute :container_port, kind_of: Fixnum

# labels added to the service itself
attribute :labels, default: {}, kind_of: [Hash,Array,String]

# labels that the service will use to select which containers to route to
attribute :selector, default: {}, kind_of: [Hash,Array,String]