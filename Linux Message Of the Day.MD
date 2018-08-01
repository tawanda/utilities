# Option 1

To change the message displayed before login, edit /etc/ssh/sshd_config :

`sudo vim /etc/ssh/sshd_config`

/etc/banner can be whatever file you want. Then edit /etc/banner

 `sudo vim /etc/banner`
 
 
# Option 2
To customize the pre-login message, such as to create a login banner, you need to edit /etc/issue file.


# Option 3

To customize post-login messages, you can edit some of the files in /etc/update-motd.d. Such files as 00-header and 10-help-text in that directory are safe to edit.


# Option 4

Another possibility is to add a custom function/command to your .bashrc at the end of the file.
