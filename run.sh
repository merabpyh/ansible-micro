#!/bin/bash


# указать роль при запуске
# build, checking, checkout, deploy, rollback, setup, testing

ansible-playbook -K mainbook.yml --tags=$1 -vv
