#
# Cookbook Name:: hadoop_mapr_wrapper
# Attribute:: default
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

# Default/common options for configure.sh, used by the 'configure' recipe
default['hadoop_mapr']['configure_sh']['cluster_name'] = 'my.chef.cluster.com'
default['hadoop_mapr']['configure_sh']['cldb_list'] = node['fqdn']
default['hadoop_mapr']['configure_sh']['cldb_mh_list'] = nil
default['hadoop_mapr']['configure_sh']['zookeeper_list'] = node['fqdn']
default['hadoop_mapr']['configure_sh']['refresh_roles'] = false
default['hadoop_mapr']['configure_sh']['client_only_mode'] = false
# do not autostart services by default
default['hadoop_mapr']['configure_sh']['no_autostart'] = true
# Add any additional attributes such as those for disk-setup here
default['hadoop_mapr']['configure_sh']['args'] = {}
# default['hadoop_mapr']['configure_sh']['args']['-D'] = '/dev/sdc'
# default['hadoop_mapr']['configure_sh']['args']['--isvm'] = nil

# Memory for YARN
unless node['hadoop']['yarn_site'].key?('yarn.nodemanager.resource.memory-mb')
  mem = (node['memory']['total'].to_i / 1000)
  if node['hadoop'].key?('yarn') && node['hadoop']['yarn'].key?('memory_percent')
    pct = (node['hadoop']['yarn']['memory_percent'].to_f / 100)
  else
    pct = 0.50
  end
  default['hadoop']['yarn_site']['yarn.nodemanager.resource.memory-mb'] = (mem * pct).to_i
end
