Assignment1:

Create 2 slave and them to jenkins master.

Restrict jobs for a specific jenkins slave.

Create a job that can run on either salve(any of the two).



Master slave setup

In Jenkis we follwo the concept of Master and slave to offload our central Jenkins server ( Master )

In the environment where many builds jobs need to run , it is not possible to pull all the load to our Central Jenkins server ( Master )

To prevent this we make some slave to distribute those loads.

Slave are basically the serevrs which has slave jenkis agent installed.

There should be a bi-directional connection between Master and slave is important ( TCP/IP)

1&gt;&gt;&gt;Go to the Manage Jenkins section and scroll down to the section of Manage Nodes.

2&gt;&gt;&gt;Click on New Node

3&gt;&gt;&gt;Give a name for the node, choose the Dumb slave option and click on ok.

4&gt;&gt;&gt;Enter the details of the node slave machine.Give a name for the node, choose the Dumb slave option and click on Ok.

   Enter the details of the node slave machine

5&gt;&gt;&gt;Once all the information we gave is correct then slave machine ill come online



Assignment2:

Get the list of all jobs :-

http://localhost:8080/api/json?tree/

Get the last build status :-

http://localhost:8080/job/Spring3HibernateApp-deployment(Mention job name)/lastBuild/api/json

Get the console o/p of a job build. :-

http://localhost:8080/job/Spring3HibernateApp-deployment(Mention job name)/2(Mention Build number)/consoleFull

Trigger a jenkins job build :-

http://localhost:8080/job/test\_ssh(Mention job name)/build
