#!/bin/bash
#export KERNEL_SRC_PATH=kernel/sony/msm8974
#./check-config $KERNEL_SRC_PATH/arch/arm/configs/cm_rhine_togari_row_defconfig -w

#cd $KERNEL_SRC_PATH

chmod a+x mkqcdtbootimg

ARCH=arm make CROSS_COMPILE=$CROSS_COMPILE mrproper
ARCH=arm make CROSS_COMPOILE=$CROSS_COMPILE cyanogenmod_togari_defconfig
ARCH=arm make CROSS_COMPILE=$CROSS_COMPILE

#make ARCH=arm  CROSS_COMPILE=$CROSS_COMPILE  -C M=$PWD CONFIG_PRONTO_WLAN=m CONFIG_PRIMA_WLAN_LFR=y KERNEL_BUILD=1 WLAN_ROOT=$PWD



./mkqcdtbootimg --kernel arch/arm/boot/zImage-dtb --ramdisk ramdisk.cpio.gz --base 0x00000000 --ramdisk_offset 0x02000000 --tags_offset 0x01E00000 --pagesize 2048 --cmdline "androidboot.hardware=qcom user_debug=31 msm_rtb.filter=0x37 ehci-hcd.park=3 dwc3.maximum_speed=high dwc3_msm.prop_chg_detect=Y" --dt_dir arch/arm/boot/   --dt_version 1 -o boot.img 


