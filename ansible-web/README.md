# Ansible Web Server

## Requirements
- Ansible control node
- Two Ubuntu web servers
- SSH access and sudo privileges

## Run
```bash
ansible all -m ping
ansible-playbook site.yml
```

The playbook updates packages, installs and enables Nginx, and deploys a Jinja2 website using a reusable role and handler.
