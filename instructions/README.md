# Instruction how to complete the task

1. Use Terraform to setup infrastructure with at least one server.
2. Give the sever a friendly hostname.
3. Modify hello.sh script in the test folder to print hello from the hostname of the server it is running on.
4. Write ansible playbook which instructs the server from step 2. to download hello.sh script from this project on Github in test folder. Execute the script on that server and leave the script running for 10 seconds showing the output and then cancel the execution.
5. Commit the results multiple times while you are working on the solution.
6. Document how to reproduce the results in readme file.
7. Use github actions to test hello.sh script and put github CI badge in readme file. 
8. Create pull request when you are done.
