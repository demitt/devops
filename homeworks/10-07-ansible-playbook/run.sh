#!/bin/bash

ansible-playbook -i hosts --vault-password-file=.vault_pass playbook.yml
