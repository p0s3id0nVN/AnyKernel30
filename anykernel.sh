### AnyKernel3 Ramdisk Mod Script
## osm0sis @ xda-developers

### AnyKernel setup
# global properties
properties() { "
kernel.string=p0s3id0n's fork of Wild Kernels for OnePlus
do.devicecheck=0
do.modules=0
do.systemless=0
do.cleanup=1
do.cleanuponabort=0
device.name1=
device.name2=
device.name3=
device.name4=
device.name5=
supported.versions=
supported.patchlevels=
supported.vendorpatchlevels=
"; } # end properties


### AnyKernel install
## boot shell variables
block=boot
is_slot_device=auto
ramdisk_compression=auto
patch_vbmeta_flag=auto
no_magisk_check=1

# import functions/variables and setup patching - see for reference (DO NOT REMOVE)
. tools/ak3-core.sh

kernel_version=$(cat /proc/version | awk -F '-' '{print $1}' | awk '{print $3}')
case $kernel_version in
    5.1*) ksu_supported=true ;;
    6.1*) ksu_supported=true ;;
    6.6*) ksu_supported=true ;;
    *) ksu_supported=false ;;
esac

ui_print " " "  -> OKI Kernel Supported: $ksu_supported"
$ksu_supported || abort "  -> Non-GKI device, abort."

# boot install
split_boot
if [ -f "split_img/ramdisk.cpio" ]; then
    unpack_ramdisk
    write_boot
else
    flash_boot
fi

ui_print " "
ui_print "p0s3id0n's Fork of Wild Kernels for OnePlus Telegram Channel:"
ui_print "https://t.me/+JU4XbSnYz905YjRl"
ui_print " "
ui_print "WildKernels Website:"
ui_print "https://wildkernels.dev"
ui_print " "
ui_print "ReSukiSU GitHub Repository:"
ui_print "https://github.com/ReSukiSU/ReSukiSU"
ui_print "Kernel-based Android Root Solution,forked from sukisu"
ui_print " "
ui_print "GKI_KernelSU_SUSFS GitHub Repository:"
ui_print "https://github.com/coolzyd9107/GKI_KernelSU_SUSFS"
ui_print "GKI kernels with ReSukiSU and SUSFS."
ui_print " "
ui_print "OnePlus_ReSukiSU_SUSFS GitHub Repository:"
ui_print "https://github.com/p0s3id0nNV/X7U_ReSukiSU_SUSFS"
ui_print "OnePlus kernels with KernelSU and SUSFS."
ui_print " "
ui_print "Thank for contribution from wildkernels, ReSukiSU, SUSFS and all members in Telegram channel."