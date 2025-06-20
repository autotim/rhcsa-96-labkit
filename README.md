# rhcsa-96-labkit

[![Markdown Lint](https://github.com/autotim/rhcsa-96-labkit/actions/workflows/validate-md.yml/badge.svg)](https://github.com/autotim/rhcsa-96-labkit/actions/workflows/validate-md.yml)
[![YAML Lint](https://github.com/autotim/rhcsa-96-labkit/actions/workflows/validate-yaml.yml/badge.svg)](https://github.com/autotim/rhcsa-96-labkit/actions/workflows/validate-yaml.yml)
[![Bash Lint](https://github.com/autotim/rhcsa-96-labkit/actions/workflows/validate-bash.yml/badge.svg)](https://github.com/autotim/rhcsa-96-labkit/actions/workflows/validate-bash.yml)

Welcome to the **EchoBlade RHCSA 9.6 Lab Kit** — designed for high-speed mastery of the RHCSA exam using
**AlmaLinux 9.6** in **Proxmox VE**.

> 📦 Version: RHCSA Target: RHEL 9.x
> 💻 Platform: Proxmox VE 8.x 
> 🧰 Features: Full CLI + Cockpit support  
> 🧬 *Project-Matrix™ DNA: Professionalism + Readability + Repo Hygiene*

---

## 🔧 VM Setup on Proxmox

### ✅ Base Configuration

| Setting  | Value                        |
|----------|------------------------------|
| OS ISO   | AlmaLinux-9.6-x86_64-dvd.iso |
| Boot Mode | UEFI                         |
| Cores     | 2 vCPU                       |
| RAM       | 4–8 GB                       |
| Disks     | 3 Disks (see below)         |
| NIC       | 1–2 (virtio, bridged)       |

### 💽 Disk Layout

| Disk | Size | Use                             |
|------|------|----------------------------------|
| sda  | 20GB | OS install with LVM             |
| sdb  | 10GB | LVM lab: create/extend/snapshot |
| sdc  | 5GB  | Disaster lab: LVM recovery      |

---

## 📥 Installation Notes 

1. Boot from `AlmaLinux-9.6-x86_64-dvd.iso`
2. During installation:
   - Select **Custom Partitioning** → Use **LVM**
   - Set hostname: `rhcsa-lab1`
   - Enable network interface manually
   - Enable Cockpit (if asked)
   - Use a strong root password

---

## 🛠️ Post-Install Setup Script (setup.sh)

```bash
#!/bin/bash

# Create user
useradd bandit
passwd bandit
usermod -aG wheel bandit

# Install tools
DNF_PACKAGES="vim bash-completion net-tools lvm2 firewalld policycoreutils setroubleshoot rsyslog cockpit"
dnf install -y $DNF_PACKAGES

# Enable services
systemctl enable --now firewalld
systemctl enable --now cockpit.socket
systemctl enable --now rsyslog

# Configure networking (if needed)
# nmcli con mod ...
```

---

## 🗃️ Included Lab Modules 

| Module     | File                      | Tasks Covered                              |
|------------|---------------------------|--------------------------------------------|
| Storage    | `lab-tasks/storage.md`    | LVM creation, resizing, mounting, XFS grow |
| SELinux    | `lab-tasks/selinux.md`    | Policies, contexts, troubleshooting        |
| Networking | `lab-tasks/networking.md` | `nmcli`, static IP, firewalld zones        |
| Users      | `lab-tasks/users.md`      | ACLs, user/group management, sudoers       |

---

## 📋 rhcsa-checklist.md (Full Task Overview)

### 🔐 User and Permission Management

- [ ] Create, modify, delete users and groups
- [ ] Set passwords and enforce complexity
- [ ] Add users to supplementary groups
- [ ] Configure sudo access securely
- [ ] Manage file permissions and ownership
- [ ] Configure and troubleshoot ACLs

### 🧱 Storage and File System Management

- [ ] Create and manage partitions and filesystems
- [ ] Use `xfs` and `ext4` formats
- [ ] Mount filesystems persistently with `/etc/fstab`
- [ ] Create and resize LVM volumes
- [ ] Extend mounted filesystems using `xfs_growfs`
- [ ] Create and mount LVM snapshots

### 🔧 System Services and Boot Process

- [ ] Use `systemctl` to manage services and targets
- [ ] Analyze logs with `journalctl`
- [ ] Set and switch default targets
- [ ] Recover systems with rescue mode and `chroot`

### 🌐 Networking Configuration

- [ ] Configure interfaces with `nmcli`
- [ ] Set static and DHCP addresses
- [ ] Set hostnames and verify DNS resolution
- [ ] Manage `firewalld` zones and services

### 🔐 SELinux and Security Tools

- [ ] View and set SELinux modes (enforcing, permissive)
- [ ] Restore file contexts with `restorecon`
- [ ] Use `semanage` and `chcon` for labeling
- [ ] Analyze SELinux issues with `ausearch`, `audit2allow`

### 📦 Package Management

- [ ] Use `dnf` to install, update, remove software
- [ ] Query and verify packages
- [ ] Work with repositories and GPG keys

### 🕒 Scheduling and Automation

- [ ] Create and manage `cron` jobs
- [ ] Use `at` and `systemd` timers
- [ ] Write and execute simple shell scripts

---

## ✅ Lab Ready

Once ISO is installed, and `setup.sh` is run:

> 💻 You’ll have a full RHCSA-ready system with CLI + Cockpit, networking, storage,  
> SELinux, and all core services.

---

## 📂 lab-tasks/

Each file below contains guided steps, command references, and verification tips.

- [**lab-tasks/storage.md**](https://github.com/autotim/rhcsa-96-labkit/blob/main/lab-tasks/storage.md) – Logical Volume Management, XFS, mounting, snapshots
- [**lab-tasks/selinux.md**](https://github.com/autotim/rhcsa-96-labkit/blob/main/lab-tasks/selinux.md) – SELinux enforcing, policies, contexts, audit logs
- [**lab-tasks/networking.md**](https://github.com/autotim/rhcsa-96-labkit/blob/main/lab-tasks/networking.md) – Static IP config, `nmcli`, DNS, firewalld zones
- [**lab-tasks/users.md**](https://github.com/autotim/rhcsa-96-labkit/blob/main/lab-tasks/users.md) – User management, password rules, ACLs, sudo
