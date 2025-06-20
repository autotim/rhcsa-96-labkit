# lab-tasks/selinux.md

## 🔐 RHCSA SELinux Lab

This module contains essential SELinux tasks tested in the RHCSA 9.x exam using AlmaLinux 9.6. 

> 🎯 Focus: SELinux modes, context management, troubleshooting denials.

---

## 🔧 Task 1: Check SELinux Status and Mode

```bash
sestatus
enforcing | permissive | disabled
```

## 🔧 Task 2: Change SELinux Mode Temporarily

```bash
setenforce 0   # Permissive
setenforce 1   # Enforcing
```

## 🔧 Task 3: Change SELinux Mode Permanently

```bash
vim /etc/selinux/config
# Change SELINUX=enforcing or permissive
```

---

## 🧩 Task 4: Restore Default File Contexts

```bash
restorecon -Rv /var/www/html
```

## 🧩 Task 5: View Current Contexts

```bash
ls -lZ /var/www/html
```

## 🧩 Task 6: Use semanage to Set Persistent Contexts

```bash
semanage fcontext -a -t httpd_sys_content_t "/webcontent(/.*)?"
restorecon -Rv /webcontent
```

## 🧩 Task 7: Change Context Temporarily with chcon

```bash
chcon -t httpd_sys_content_t /index.html
```

---

## 🕵️ Task 8: Troubleshoot Denials Using Logs 

```bash
ausearch -m avc -ts recent
```

## 🧙 Task 9: Generate Allow Rules from AVC Logs

```bash
audit2why < /var/log/audit/audit.log
audit2allow -w -a  # Show why denied
audit2allow -a -M mypol
semodule -i mypol.pp
```

---

## ✅ Verification Tips

* `getenforce`, `sestatus`, `ls -Z`, `semanage fcontext -l`
* Check `/var/log/audit/audit.log` for AVC denials
* Always `restorecon` after `semanage fcontext`

---

## 📌 Notes

* Don’t confuse `chcon` (temporary) with `semanage` (permanent)
* You can use Cockpit SELinux tool for easier context review
* SELinux is often disabled on minimal installs — enable it for practice

---

**Next:** [Networking Lab »](networking.md)
