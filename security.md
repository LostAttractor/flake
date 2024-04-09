# WIP

# Introduction

The premise of everything in this article is that the link between cpu and tpm cannot be side-channel attacked or the key can be derived through vulnerabilities (like the fTPM vulnerability for AMD's ZEN3 cpus).

At the same time, side-channel attacks or cold boot attacks on memory links may also be able to steal the keys stored in the TPM.

# TPM PCRS

PCR 0~3 is BIOS binary/settings, extended or pluggable devices binary/settings (that can DMA).

When external device binary is verified, it may not be possible to export the key from the TPM at all. But considering the worst case scenario, IOMMU and Pre boot DMA protection are still necessary to ensure security.

PCR 4,9,11 will change when nixos-rebuild, but since there is secure boot, this is not a problem.

So here we verify all values ​​from 0 to 9 except 4, and also verify 12 from 11 to 14 :


```bash
sudo systemd-cryptenroll /dev/nvme0n1p2 --wipe-slot=tpm2 --tpm2-device=auto --tpm2-pcrs=0+1+2+3+5+6+7+8+12
```

## Show all PCRs

```bash
systemd-analyze pcrs

NR NAME                SHA256                                                          
 0 platform-code       17fd69d452d578af04c65db302d5d2bc04faf1bd691b523be36dea198f09fc9d
 1 platform-config     31016a55db0129c763093ddaf9b2b74ddcd7bb4d4005df5873b0f77666634522
 2 external-code       3d458cfe55cc03ea1f443f1562beec8df51c75e14a9fcf9a7234a13f198e7969
 3 external-config     3d458cfe55cc03ea1f443f1562beec8df51c75e14a9fcf9a7234a13f198e7969
 4 boot-loader-code    b0396a197f78233fd587060cc48dfb1e27ce910326c75fdf130996c48f851b85
 5 boot-loader-config  dc76310226ff6e715c60aa7484dac85b580170ca6cd89402f47a078180be9fe5
 6 host-platform       3d458cfe55cc03ea1f443f1562beec8df51c75e14a9fcf9a7234a13f198e7969
 7 secure-boot-policy  e5207fc1b545ae5e1fe575f7f6b4ac5fbe549420414c5a71d6357de6c0c749d6
 8 -                   0000000000000000000000000000000000000000000000000000000000000000
 9 kernel-initrd       c3ab37e05b8bcd4e28f69618f0096bdce2df782fed71b59fdf1ef7150b7fc422
10 ima                 0000000000000000000000000000000000000000000000000000000000000000
11 kernel-boot         2009a0c0571b8305f7ba3ed5948b7e10e6d0c7dd8c6c9e0aa0ea766adb55c078
12 kernel-config       0000000000000000000000000000000000000000000000000000000000000000
13 sysexts             0000000000000000000000000000000000000000000000000000000000000000
14 shim-policy         0000000000000000000000000000000000000000000000000000000000000000
15 system-identity     0000000000000000000000000000000000000000000000000000000000000000
16 debug               0000000000000000000000000000000000000000000000000000000000000000
17 -                   ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
18 -                   ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
19 -                   ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
20 -                   ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
21 -                   ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
22 -                   ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
23 application-support 0000000000000000000000000000000000000000000000000000000000000000
```

# AppArmor (TODO)

# Reference
https://wiki.archlinux.org/title/Trusted_Platform_Module