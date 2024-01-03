echo Building RPM

# Warning, because of this we can't build to rpms on the same build
# server at the same time.  
rm -rf ~/.rpmmacros
echo '%_topdir ' $(pwd)  > ~/.rpmmacros
rpmbuild -ba SPECS/redhat-lsb.spec

tar --transform 's,^RPMS/,redhat-lsb/,' -czf redhat-lsb-rpms.tgz RPMS

