# lab-tasks/storage.md

## 🧱 RHCSA Storage Lab

This module walks through the essential storage tasks covered in the RHCSA 9.x exam using AlmaLinux 9.6.

> 🎯 Focus: LVM, XFS, `/etc/fstab`, and snapshot management.

---

## 📦 Task 1: Create a Physical Volume (PV)

```bash
pvcreate /dev/sdb
```

## 📦 Task 2: Create a Volume Group (VG)

```bash
vgcreate labvg /dev/sdb
```

## 📦 Task 3: Create a Logical Volume (LV)

```bash
lvcreate -L 2G -n datavol labvg
```

## 📦 Task 4: Format the Logical Volume with XFS

```bash
mkfs.xfs /dev/labvg/datavol
```

## 📦 Task 5: Mount the LV and Make it Persistent

```bash
mkdir /data
mount /dev/labvg/datavol /data

# Make persistent
echo '/dev/labvg/datavol /data xfs defaults 0 0' >> /etc/fstab
```

## 📦 Task 6: Resize the Logical Volume and Filesystem

```bash
lvextend -L +1G /dev/labvg/datavol
xfs_growfs /data
```

## 📦 Task 7: Create and Use an LVM Snapshot 

```bash
lvcreate -s -L 500M -n datavol_snap /dev/labvg/datavol
# Mount snapshot (read-only)
mount -o ro /dev/labvg/datavol_snap /mnt/snap
```

## 📦 Task 8: Delete a Snapshot

```bash
umount /mnt/snap
lvremove /dev/labvg/datavol_snap
```

---

## ✅ Verification Tips

* Use `lsblk`, `df -h`, `mount`, `vgs`, `lvs` to confirm changes
* Use `blkid` to verify file system types
* Make a typo in `/etc/fstab` and test rescue boot for practice 😈

---

## 📌 Notes

* XFS doesn’t support shrinking — always plan ahead
* Snapshots grow until full or deleted — monitor with `lvs`
* Always unmount before removing volumes or snapshots

---

**Next:** [SELinux Lab »](selinux.md)
