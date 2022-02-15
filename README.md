## Automated ELK Stack Deployment

The files in this repository were used to configure the network depicted below.


![](https://github.com/JayTaylor-Or/InfoSecRepo/blob/main/Diagrams/NetworkDiagram.drawio.png)


These files have been tested and used to generate a live ELK deployment on Azure. They can be used to either recreate the entire deployment pictured above. Alternatively, select portions of the YML file may be used to install only certain pieces of it, such as Filebeat.

 - [install-elk.yml](https://github.com/JayTaylor-Or/InfoSecRepo/blob/main/Ansible/install-elk.yml)
 - [filebeat-playbook.yml](https://github.com/JayTaylor-Or/InfoSecRepo/blob/main/Ansible/install-elk.yml)
 - [metricbeat-playbook.yml](https://github.com/JayTaylor-Or/InfoSecRepo/blob/main/Ansible/metricbeat-playbook.yml)

This document contains the following details:
- Description of the Topology
- Access Policies
- ELK Configuration
  - Beats in Use
  - Machines Being Monitored
- How to Use the Ansible Playbook


### Description of the Topology

The main purpose of this network is to expose a load-balanced and monitored instance of DVWA, the D*mn Vulnerable Web Application.

*Load balancing ensures that the application will be highly available, in addition to restricting access to the network. *

- What aspect of security do load balancers protect? What is the advantage of a jump box?

*Load Balancers distribute (or offload to a public cloud) excess network traffic to protect against DDoS attacks and keep the network available and active. A Jump Box allows remote access to configure/manage devices/VM's throughout different security zones in the network. *

Integrating an ELK server allows users to easily monitor the vulnerable VMs for changes to the files and OS/system logs .
- Filebeat collects event data and file state on specified individual files and file types, which outputs the data where/how you choose.
- Metricbeat collects metric data from the OS and running services on the server, which also outputs that data.

The configuration details of each machine.

| Name     | Function | IP Address | Operating System |
|----------|----------|------------|------------------|
| Jump Box |Gateway   | 10.0.0.4   | Linux            |
| Web-1    |WebServer | 10.0.0.5   | Linux            |
| Web-2    |WebServer | 10.0.0.6   | Linux            |
| ELK-VM   |ELK Server| 10.2.0.6   | Linux            |

### Access Policies

The machines on the internal network are not exposed to the public Internet. 

Only the Jump-Box machine can accept connections from the Internet. Access to this machine is only allowed from the following IP addresses:
- `73.180.4.168`

Machines within the network can only be accessed by the Jump-Box.

ELK access: Jump-Box(Ansible Container) `13.83.15.56`

A summary of the access policies.

| Name     | Publicly Accessible | Allowed IP Addresses |
|----------|---------------------|----------------------|
| Jump Box | No                  | 73.180.4.168         |
|Web-1     | No                  | 13.83.15.56          |
|Web-2     | No                  | 13.83.15.56          |
|ELK-VM    | No                  | 13.83.15.56          |

### Elk Configuration

Ansible was used to automate configuration of the ELK machine. No configuration was performed manually, which is advantageous because...
-It's efficient, available, free, scalable and less prone to human error.

The playbook implements the following tasks:
- Configure ELK server to use more memory
- Install docker.io
- Install pip3
- Install python module
- Install elk docker container
- Enable docker service on boot

The following screenshot displays the result of running `docker ps` after successfully configuring the ELK instance.

![](https://github.com/JayTaylor-Or/InfoSecRepo/blob/main/Diagrams/docker%20ps.png)

### Target Machines & Beats
This ELK server is configured to monitor the following machines:
- `10.0.0.5 (Web-1)`
- `10.0.0.6 (Web-2)`

We have installed the following Beats on these machines:
- Metricbeat
- Filebeat


These Beats allow us to collect the following information from each machine:
- Metricbeat: Allows for system(OS) level metrics like CPU usage, file system, memory and for stats on running services like Apache, MySQL, Nginix etc. This data can be output to a service like Logstash.
- Filebeat: The 'Input' Collects and monitors file data by choosing the file/filetype and passing it to a 'Harvester' that opens/closes each file, which keeps the state of the file. This info is output to a service like Elasticsearch or Logstash 

### Using the Playbooks
In order to use the playbook, you will need to have an Ansible control node already configured. Assuming you have such a control node provisioned: 

SSH into the control node and follow the steps below:
- Copy the config.yml file to the Ansible dir.
- In config file update the ELK VM hosts: `10.2.0.6:9200` and `10.2.0.6:5601`
- Run the playbook, and navigate to `(ELK-VM)20.127.54.53:5601/app/kibana` to check that the installation worked as expected.

**Answer the following questions:**
- Which file is the playbook? `filebeat-playbook.yml` 
- Where do you copy it? From:`etc/filebeat/`  To: `etc/ansible/`
- Which file do you update to make Ansible run the playbook on a specific machine? `filebeat-config.yml` 
- How do I specify which machine to install the ELK server on versus which to install Filebeat on? `Ansible.cfg` Indicate host,remote user
- Which URL do you navigate to in order to check that the ELK server is running? `20.127.54.53:5601/app/kibana`

Will provide the specific commands needed to run/download the playbook, update the file etc.
