
# Orchestrator portal Pipeline

The Orchestrator Portal pipeline allow to create a azure project by receving a json payload from orchestrator portal and executing the 


## Features

- Creates and updates service connections
- Creates and updates service connections rbac assignments
- Creates and updates variable groups
- Creates and updates project features
- Creates and updates environment, policies and hooks
- Allow to recreate project if required
- Single source of truth for azure project configuration

## Architecture

![alt text](orchestrator_portal.png)

## Azure DevOps Permissions

The azure devops repository must use an app registrarion {{parameters.automation_principal}} with permission to other repos to edit them

Typical required roles include:

-[ORG]\Project Collection Administrators

-[ORG]\Project Collection Build Service Accounts
