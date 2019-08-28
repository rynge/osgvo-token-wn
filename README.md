
```
docker run -it --rm --user osg \
       --cap-add=DAC_OVERRIDE --cap-add=SETUID --cap-add=SETGID \
       --cap-add=SYS_ADMIN --cap-add=SYS_CHROOT --cap-add=SYS_PTRACE \
       -v /cvmfs:/cvmfs -e TOKEN="TOKENGOESHERE" \
       rynge/osgvo-token-wn:latest
```

