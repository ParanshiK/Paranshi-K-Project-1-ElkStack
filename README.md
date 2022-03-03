## Automated ELK Stack Deployment

The files in this repository were used to configure the network depicted below.

(Images/Network Diagram 2.png)

These files have been tested and used to generate a live ELK deployment on Azure. They can be used to either recreate the entire deployment pictured above. Alternatively, select portions of the playbook file may be used to install only certain pieces of it, such as Filebeat.

  - Ansible/roles/my-playbook.yml
  - Ansible/roles/filebeat-playbook.yml
  - Ansible/roles/metricbeat-playbook.yml
  - Ansible/roles/install-elk.yml

This document contains the following details:
- Description of the Topologu
- Access Policies
- ELK Configuration
  - Beats in Use
  - Machines Being Monitored
- How to Use the Ansible Build


### Description of the Topology

The main purpose of this network is to expose a load-balanced and monitored instance of DVWA, the D*mn Vulnerable Web Application.

Load balancing ensures that the application will be highly available, in addition to restricting access to the network.

Integrating an ELK server allows users to easily monitor the vulnerable VMs for changes to the log files and system metrics.

The configuration details of each machine may be found below.
_Note: Use the [Markdown Table Generator](http://www.tablesgenerator.com/markdown_tables) to add/remove values from the table_.

| Name     | Function | IP Address | Operating System |
|----------|----------|------------|------------------|
| Jump Box | Gateway  | 10.0.0.6   | Linux            |
| Web-1    | Application Server | 10.0.0.7 | Linux    |
| Web-2    | Application Server | 10.0.0.8 | Linux    |
| Elk_VM   | Application Server | 10.1.0.4 | Linux    |

### Access Policies

The machines on the internal network are not exposed to the public Internet. 

Only the Jump-Box-Provisioner and Elk Stack machines can accept connections from the Internet. Access to this machine is only allowed from the following IP addresses:
- _My Home IP address_

Machines within the network can only be accessed by the Jump-Box-Provisioner machine.
- _The Elk VM can be accessed by the Jump-box-Provisioner as well which has the ip address, 10.0.0.6_

A summary of the access policies in place can be found in the table below.

| Name     | Publicly Accessible | Allowed IP Addresses |
|----------|---------------------|----------------------|
| Jump Box | Yes                 | Home IP address      |
| Web-1    | No                  | 10.0.0.6             |
| Web-2    | No                  | 10.0.0.6             |
| Elk_VM   | Yes                 | Home IP address      |

### Elk Configuration

Ansible was used to automate configuration of the ELK machine. No configuration was performed manually, which is advantageous because...
- _it increases efficiency, and eliminates errors and inconsistencies in regular configuration._

The playbook implements the following tasks:
- _Configure the maxximum mapped memory using the systemcl module_
- _Install docker.io and python3-pip packages using the apt module_
- _Install docker python package with pip
- _Enable systemd docker service_
- _Run ELK docker container_

The following screenshot displays the result of running `docker ps` after successfully configuring the ELK instance.

![TODO: Update the path with the name of your screenshot of docker ps output](Images/docker_ps_output.png)

### Target Machines & Beats
This ELK server is configured to monitor the following machines:
- _Web-1: 10.0.0.7_
- _Web-2: 10.0.0.8_

We have installed the following Beats on these machines:
- _Filebeat_
- _Metricbeat_

These Beats allow us to collect the following information from each machine:
- _Filebeat forwards the system's log data to elasticsearch and Logstash for indexing including audit logs, gc logs, server logs etc._
- _Metricbeat forwards statistics on system and service metrics including CPU, memory or data linked with the services running on the server._

### Using the Playbook
In order to use the playbook, you will need to have an Ansible control node already configured. Assuming you have such a control node provisioned: 

SSH into the control node and follow the steps below:
- Copy the install-elk.yml file to /etc/ansible/roles.
- Update the /etc/ansible/hosts file to include the Elk_VM Ip address.
- Run the playbook, and navigate to http://[your.elk.ip]:5601/app/kibana to check that the installation worked as expected.
