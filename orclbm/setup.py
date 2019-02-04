# Licensed to the Apache Software Foundation (ASF) under one or more
# contributor license agreements.  See the NOTICE file distributed with
# this work for additional information regarding copyright ownership.
# The ASF licenses this file to You under the Apache License, Version 2.0
# (the "License"); you may not use this file except in compliance with
# the License.  You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

"""Setup.py module for the workflow's worker utilities.

All the workflow related code is gathered in a package that will be built as a
source distribution, staged in the staging area for the workflow being run and
then installed in the workers when they start running.

This behavior is triggered by specifying the --setup_file command line option
when running the workflow for remote execution.
"""


import subprocess
from distutils.command.build import build as _build

import setuptools


# This class handles the pip install mechanism.
class build(_build):  # pylint: disable=invalid-name
    """A build command class that will be invoked during package install.

    The package built using the current setup.py will be staged and later
    installed in the worker using `pip install package'. This class will be
    instantiated during install for this specific scenario and will trigger
    running the custom commands specified.
    """
    sub_commands = _build.sub_commands + [('CustomCommands', None)]


# Some custom command to run during setup. The command is not essential for this
# workflow. It is used here as an example. Each command will spawn a child
# process. Typically, these commands will include steps to install non-Python
# packages. For instance, to install a C++-based library libjpeg62 the following
# two commands will have to be added:
#
#     ['apt-get', 'update'],
#     ['apt-get', '--assume-yes', 'install', 'libjpeg62'],
#
# First, note that there is no need to use the sudo command because the setup
# script runs with appropriate access.
# Second, if apt-get tool is used then the first command needs to be 'apt-get
# update' so the tool refreshes itself and initializes links to download
# repositories.  Without this initial step the other apt-get install commands
# will fail with package not found errors. Note also --assume-yes option which
# shortcuts the interactive confirmation.
#
# Note that in this example custom commands will run after installing required
# packages. If you have a PyPI package that depends on one of the custom
# commands, move installation of the dependent package to the list of custom
# commands, e.g.:
#
#     ['pip', 'install', 'my_package'],
#
# TODO(BEAM-3237): Output from the custom commands are missing from the logs.
# The output of custom commands (including failures) will be logged in the
# worker-startup log.
CUSTOM_COMMANDS = [
['sudo','apt-get', 'update'],
['sudo','mkdir','-p','/opt/oracle'],
['sudo','apt-get','--assume-yes','install','unzip'],
['wget','https://storage.googleapis.com/crfbeamstoragebucket/instantclient-basic-linux.x64-18.3.0.0.0dbru.zip'],
['sudo','unzip','-o', 'instantclient-basic-linux.x64-18.3.0.0.0dbru.zip', '-d' ,'/opt/oracle'],
['sudo','unzip','-o', 'instantclient-basic-linux.x64-18.3.0.0.0dbru.zip'],
['sudo','apt-get','--assume-yes','install','libaio1'],
['sudo','sh','-c','echo "/opt/oracle/instantclient_18_3" > /etc/ld.so.conf.d/oracle-instantclient.conf'],
['sudo','ldconfig'],
]

#CUSTOM_COMMANDS = [
#    ['apt-get', 'update'],
#    ['apt-get', '--assume-yes', 'install', 'libmysqlclient-dev'],
#    ['apt-get', '--assume-yes', 'install', 'python-dev'],
#    ['apt-get', '--assume-yes', 'install', 'libssl1.0.0'],
#    ['apt-get', '--assume-yes', 'install', 'libssl-dev'],
#    ['apt-get', '--assume-yes', 'install', 'libxml2-dev'],
#    ['apt-get', '--assume-yes', 'install', 'libxslt1-dev'],
#    ['pip', 'install', 'pyga==2.5.1'],
#    ['pip', 'install', 'MySQL-python==1.2.5'],
#    ['apt-get', '--assume-yes', 'install', 'libffi-dev'],
#    ['pip', 'install', 'fluent-logger==0.4.4'],
#    ['pip', 'install', 'phonenumbers==7.7.2'],
#    ['pip', 'install', 'python-dateutil==2.5.3'],
#    ['pip', 'install', 'google-api-python-client==1.5.4'],
#    ['pip', 'install', 'suds==0.4'],
#    ['pip', 'install', 'websocket-client==0.37.0'],
#    ['pip', 'install', 'tornado==4.4.2'],
#    ['pip', 'install', 'progressbar2==3.10.1'],
#    ['pip', 'install', 'pyOpenSSL==16.2.0'],
#    ['pip', 'install', 'futures==3.0.5'],
#    ['pip', 'install', 'requests==2.4.3'],
#    ['pip', 'install', 'SQLAlchemy==1.1.2']
#]


class CustomCommands(setuptools.Command):
    """A setuptools Command class able to run arbitrary commands."""

    def initialize_options(self):
        pass

    def finalize_options(self):
        pass

    def RunCustomCommand(self, command_list):
        print('Running command: %s' % command_list)
        p = subprocess.Popen(
            command_list,
            stdin=subprocess.PIPE, stdout=subprocess.PIPE, stderr=subprocess.STDOUT)
        # Can use communicate(input='y\n'.encode()) if the command run requires
        # some confirmation.
        stdout_data, _ = p.communicate()
        print('Command output: %s' % stdout_data)
        if p.returncode != 0:
            raise RuntimeError('Command %s failed: exit code: %s' % (command_list, p.returncode))

    def run(self):
        for command in CUSTOM_COMMANDS:
            self.RunCustomCommand(command)


# Configure the required packages and scripts to install.
# Note that the Python Dataflow containers come with numpy already installed
# so this dependency will not trigger anything to be installed unless a version
# restriction is specified.
REQUIRED_PACKAGES = ['numpy','apache_beam','apache_beam[gcp]','cx_Oracle','datetime','google-cloud-bigquery>1.6.0,<1.7.0']


setuptools.setup(
    name='orclbm',
    version='0.0.1',
    description='Oraclebm workflow package.',
    install_requires=REQUIRED_PACKAGES,
    packages=setuptools.find_packages(),
    cmdclass={
        # Command class instantiated and run during pip install scenarios.
        'build': build,
        'CustomCommands': CustomCommands,
        }
    )