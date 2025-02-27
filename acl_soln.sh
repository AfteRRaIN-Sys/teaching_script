mkdir /accounting/
mkdir /engineering/

useradd userA && passwd userA
useradd userB && passwd userB
useradd userC && passwd userC
useradd userD && passwd userD

groupadd accounting
groupadd accounting_head
groupadd engineering_head
groupadd engineering

# groups
# cat /etc/group
# cat /etc/passwd

usermod -aG accounting -s /bin/bash userA
usermod -aG accounting_head userA
usermod -aG accounting -s /bin/bash userB
usermod -aG engineering -s /bin/bash userC
usermod -aG engineering_head userC
usermod -aG engineering -s /bin/bash userD

# su userD
# mkdir accounting/
# setfacl -m g:accounting:rx /accounting/
# getfacl

# install acl
apt update && apt -y install acl

# set accounting/ permission
setfacl -m g:accounting:rx /accounting/
setfacl -m g:accounting_head:rwx /accounting/ # ls -al | grep accounting # should now have "+" sign

# set engineering/ permission
setfacl -m g:engineering:rx /engineering/
setfacl -m g:engineering_head:rwx /engineering/

# set permission for department heads
setfacl -m g:accounting_head:r /engineering/
setfacl -m g:engineering_head:r /accounting/

# set permission for others
chmod 770 accounting/
chmod 770 engineering/
