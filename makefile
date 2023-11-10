.PHONY: ansible

ansible:
	ansible-playbook -i inventory.yaml main.yaml

ansible-try:
	ansible -i inventory.yaml all -m ping
