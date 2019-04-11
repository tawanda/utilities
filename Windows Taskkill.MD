Open up an Administrative level Command Prompt and run tasklist to see all of the running processes:

C:\>tasklist
 
 Image Name                     PID Session Name        Mem Usage
 ========================= ======== ================ ============
 firefox.exe                  26356 Console             139,352 K
 regedit.exe                  24244 Console               9,768 K
 cmd.exe                      18664 Console               2,380 K
 conhost.exe                   2528 Console               7,852 K
 notepad.exe                  17364 Console               7,892 K
 notepad.exe                  24696 Console              22,028 K
 notepad.exe                  25304 Console               5,852 K
 explorer.exe                  2864 Console              72,232 K
In the example above you can see the image name and the PID for each process. If you want to kill the firefox process run:

C:\>Taskkill /IM firefox.exe /F
 or

C:\>Taskkill /PID 26356 /F
The /f flag is kills the process forcefully.  Failure to use the /F flag will result in nothing happening in some cases.  One example is whenever I want to kill the explorer.exe process I have to use the /F flag or else the process just does not terminate.

If you have multiple instances of an image open such as multiple firefox.exe processes, running the taskkill /IM firefox.exe command will kill all instances. When you specify the PID only the specific instane of firefox will be terminated.

The real power of taskkill are the filtering options that allow you to use the following variables and operators.

Variables:

STATUS
IMAGENAME
PID
SESSION
CPUTIME
MEMUSAGE
USERNAME
MODULES
SERVICES
WINDOWTITLE
Operators:

eq (equals)
ne (not equal)
gt (greater than)
lt (less than)
ge (greater than or equal)
le (less than or equal)
"*" is the wildcard.

You can use the variables and operators with the /FI filtering flag.  For example, let's say you want to end all processes that have a window title that starts with "Internet":

C:\>taskkill /FI "WINDOWTITLE eq Internet*" /F
How about killing all processes running under the Steve account:

C:\>taskkill /FI "USERNAME eq Steve" /F
It is also possible to kill a process running on a remote computer with taskkill.  Just run the following to kill notepad.exe on a remote computer called SteveDesktop:

C:\>taskkill /S SteveDesktop /U RemoteAccountName /P RemoteAccountPassword /IM notepad.exe /F
To learn more about taskkill run it with the /? command just like any other Windows command.
