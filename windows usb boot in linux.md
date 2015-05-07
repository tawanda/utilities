
# Create a bootable windows usb in linux using gparted and ms-sys

Open Gparted as root.
Head over to your external drive.
Create a new ms dos partition table.
Then create a new NTFS partition on the entire drive (you can't have more than 1 partition).
Then flag the partition as bootable.
Then, extract the .ISO. Use p7zip -x window.iso
Copy all the files from the ISO to your USB drive.
After, use this command from the ms-sys package:
ms-sys -7 /dev/sd(your drive letter)
Aaaaaaaaaaaaaaaaaaaand you're done.
