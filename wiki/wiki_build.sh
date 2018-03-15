#!/usr/bin/expect -f

set timeout -1
spawn  /confluence/atlassian-confluence-5.9.10-x64.bin
expect "*OK*"
send "\r"
expect  "*Upgrade an existing Confluence installation*"
send "2\r"
expect "*\[/opt/atlassian/confluence]*"
send "/confluence/confluence\r"
expect  "*\[/var/atlassian/application-data/confluence\]*"
send "/confluence/confluence_data\r"
expect  "*Set custom value for HTTP and Control ports*"
send "\r";
expect  "*Confluence can be run in the background*"
send "n\r"
expect  "*Finishing installation *"
expect eof
exit
rm -rf /confluence/atlassian-confluence-5.9.10-x64.bin






