# lab-tasks/networking.md

## 🌐 RHCSA Networking Lab

This module focuses on key networking tasks in RHCSA 9.x using AlmaLinux 9.6, especially via `nmcli` and `firewalld`.

> 🎯 Focus: Interface management, static IP config, hostname, firewalld zones.

---

## 🔌 Task 1: Show Network Devices

```bash
nmcli device
nmcli connection show
```

## 🔌 Task 2: Set a Static IP Address

````bash
nmcli con mod "ens18" ipv4.addresses 192.168.100.50/24 \
  ipv4.gateway 192.168.100.1 \
  ipv4.dns 1.1.1.1 \
  ipv4.method manual
nmcli con up "ens18"\```

## 🔌 Task 3: Set Hostname
```bash
hostnamectl set-hostname rhcsa-lab1
````

## 🔌 Task 4: Restart Network Services

```bash
nmcli networking off && nmcli networking on
```

---

## 🔥 Task 5: Check and Start firewalld

```bash
systemctl status firewalld
systemctl enable --now firewalld
```

## 🔥 Task 6: Allow a Service Through the Firewall

```bash
firewall-cmd --add-service=http --permanent
firewall-cmd --reload
```

## 🔥 Task 7: Add a Custom Port to a Zone

```bash
firewall-cmd --zone=public --add-port=8080/tcp --permanent
firewall-cmd --reload
```

## 🔥 Task 8: List Zones and Rules

```bash
firewall-cmd --get-active-zones
firewall-cmd --list-all --zone=public
```

---

## ✅ Verification Tips

* Use `ip a`, `ping`, `dig`, `curl` to test IP/DNS connectivity
* `nmcli con show` to verify persistence
* `firewall-cmd --list-all` to verify zone state

---

## 📌 Notes

* Make a backup of `/etc/NetworkManager/system-connections/` before editing manually
* Static IP config survives reboots only if `ipv4.method` is set to `manual`
* Cockpit also includes a network manager module for visual learners

---

**Next:** [User Management Lab »](users.md)
