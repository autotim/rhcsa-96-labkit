# lab-tasks/users.md

## 🔐 RHCSA User Management Lab

This module covers user and group administration tasks required for RHCSA 9.x certification. 

> 🎯 Focus: User creation, password policies, ACLs, sudo, group permissions.

---

## 👤 Task 1: Create Users and Groups

```bash
useradd jdoe
passwd jdoe

# Create group and add user
groupadd devs
usermod -aG devs jdoe
```

## 👥 Task 2: Create a User with Custom Shell and Home

```bash
useradd -m -s /bin/bash alice
passwd alice
```

## 👮 Task 3: Lock and Unlock Users

```bash
passwd -l jdoe  # Lock
passwd -u jdoe  # Unlock
```

---

## 🧷 Task 4: Configure Password Expiration Policies

```bash
chage -l jdoe
chage -M 90 -m 7 -W 14 jdoe  # Max 90 days, min 7, warn 14
```

## 🧷 Task 5: Force Password Reset on First Login

```bash
chage -d 0 alice
```

---

## 🛡️ Task 6: Configure Sudo Access

```bash
usermod -aG wheel alice
# or edit /etc/sudoers (careful!)
visudo
```

---

## 🧾 Task 7: Manage File Ownership and Permissions

```bash
chown alice:devs /project
chmod 770 /project
```

## 🧾 Task 8: Set Access Control Lists (ACLs)

```bash
setfacl -m u:jdoe:rwx /project
getfacl /project
```

## 🧾 Task 9: Remove ACLs

```bash
setfacl -x u:jdoe /project
```

---

## ✅ Verification Tips

* `id jdoe`, `groups alice`, `getfacl`, `ls -l` for quick checks
* Test sudo: `su - alice` then `sudo whoami`
* Check `/etc/shadow` for password expiry

---

## 📌 Notes

* Don’t forget `-m` to create home directory for users
* Always use `visudo` to avoid syntax errors
* ACLs override traditional permission bits when used

---

✅ End of Lab Series – you’re RHCSA battle-ready! 🧠💪
