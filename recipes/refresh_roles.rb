#
# Cookbook Name:: hadoop_mapr_wrapper
# Recipe:: refresh_roles
#
# Copyright © 2013-2015 Cask Data, Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# Invoke configure.sh with the -R flag, which refreshes MapR role configuration on this node
hadoop_mapr_configure node['hadoop_mapr']['configure_sh']['cluster_name'] do
  refresh_roles true
  action :run
  only_if "grep \"^#{node['hadoop_mapr']['configure_sh']['cluster_name']}\" #{node['hadoop_mapr']['install_dir']}/conf/mapr-clusters.conf"
end
