DSL JOB for hello world :-

Create a new item

In build section select Process job DSL&#39;s

Select Use the provided DSL scripts

Enter the DSL scripts :-

freeStyleJob(&#39;test-dsl2&#39;) {

parameters {

stringParam(&#39;yourName&#39;, &#39;ninja&#39;, &#39;Enter your Name&#39;)

}

steps {

  shell {

command(&#39;&#39;&#39;\

#!/bin/bash

echo &quot;Hello $yourName&quot;

&#39;&#39;&#39;.stripIndent())

  }

 }

}

hellotoperson Job (Take SALUTATION as choice parameter &amp; NAME as string parameter) :-

In build section select Process job DSL&#39;s

Select Use the provided DSL scripts

Enter the DSL scripts :-

freeStyleJob(&#39;Hello\_to\_person&#39;) {

parameters {

stringParam(&#39;yourName&#39;, &#39;ninja&#39;, &#39;Enter your Name&#39;)

choiceParam(&#39;SALUTATION&#39;, [&#39;Mr.&#39;,&#39;Mrs.&#39;], &#39;Enter Salutation&#39;)

}

steps {

  shell {

command(&#39;&#39;&#39;\

#!/bin/bash

echo &quot;Hello $yourName&quot;

&#39;&#39;&#39;.stripIndent())

  }

 }

}

Gitclone and list content of cloned directory :-

In build section select Process job DSL&#39;s

Select Use the provided DSL scripts

Enter the DSL scripts :-

freeStyleJob(&#39;Git\_clone&#39;) {

    scm {

        git {

            remote {

                github(&#39;kavitnarwal/kavit\_narwal&#39;, &#39;https&#39;)

            }

        }

    }

  steps {

  shell {

command(&#39;&#39;&#39;\

#!/bin/bash

ls -la

&#39;&#39;&#39;.stripIndent())

}

  }

}



buildperiodically Job (This job will run by every 5 min) :-



In build section select Process job DSL&#39;s

Select Use the provided DSL scripts

Enter the DSL scripts :-

freeStyleJob(&#39;Build\_Periodically&#39;) {

    triggers

{

  cron(&quot;H/5 \* \* \* \*&quot;)

}

  steps {

  shell {

command(&#39;&#39;&#39;\

#!/bin/bash

ls -la

&#39;&#39;&#39;.stripIndent())

}

  }

}



pollscm Job (This job will have a poll interval of 2 min) :-

In build section select Process job DSL&#39;s

Select Use the provided DSL scripts

Enter the DSL scripts :-

job(&quot;PollSCM&quot;) {

 description(&quot;I\&#39;ll perform poll scm&quot;)

 logRotator(-1, 10)

 scm {

    git {

     remote {

       url(&quot;https://github.com/ot-training/jenkins.git&quot;)

     }

      branch(&quot;\*/master&quot;)

    }

  }

  triggers {

        scm(&#39;H/2 \* \* \* \*&#39;)

    }

 steps {

       shell(&#39;echo &quot;Hello World!&quot;&#39;)

   }

}



upstream Job (This job have helloworld job as upstream) :-

In build section select Process job DSL&#39;s

Select Use the provided DSL scripts

Enter the DSL scripts :-

freeStyleJob(&#39;Upstream&#39;) {

    triggers {

        upstream(&#39;test-dsl&#39;, &#39;SUCCESS&#39;)

    }

steps {

  shell {

command(&#39;&#39;&#39;\

#!/bin/bash

ls -la

&#39;&#39;&#39;.stripIndent())

  }

 }

}



downstream Job ( This job have hellotoperson job as downstream. Note: Pass variable(SALUTATION &amp; NAME) from this job to hellotoperson job.) :-

In build section select Process job DSL&#39;s

Select Use the provided DSL scripts

Enter the DSL scripts :-

freeStyleJob(&#39;Downstream&#39;) {

publishers {

        downstream(&#39;Hello\_to\_person\_DSL&#39;, &#39;SUCCESS&#39;)

parameters {

stringParam(&#39;yourName&#39;, &#39;ninja&#39;, &#39;Enter your Name&#39;)

choiceParam(&#39;SALUTATION&#39;, [&#39;Mr.&#39;,&#39;Mrs.&#39;], &#39;Enter Salutation&#39;)

}

}

steps {

  shell {

command(&#39;&#39;&#39;\

#!/bin/bash

ls -la

&#39;&#39;&#39;.stripIndent())

  }

 }

}



nestedview Job ( This job will create a nested view named as &#39;ninja-jobs&#39; with folders &#39;simple-jobs&#39; &amp; &#39;complex-jobs&#39;. simple-jobs will contain helloworld, hellotoperson, Gitclone, buildperiodically and pollscm. complex-jobs will contain upstream and downstream jobs.) :-



In build section select Process job DSL&#39;s

Select Use the provided DSL scripts

Enter the DSL scripts :-



freeStyleJob(&#39;Nested\_view&#39;) {

 nestedView(&#39;Ninja\_jobs&#39;) {

   views {

  listView (&#39;Simple\_jobs&#39;) {

          jobs {

            names (&#39;Build\_Periodically&#39;,&#39;Git\_clone&#39;,&#39;test-dsl2&#39;,&#39;test-dsl&#39;)

          }

    columns {

                status()

                weather()

                name()

                lastSuccess()

                lastFailure()

            }

        }

       listView (&#39;complex-jobs&#39;){

          jobs {

            names (&#39;Upstream&#39;,&#39;Downstream&#39;)

          }

        columns {

                status()

                weather()

                name()

                lastSuccess()

                lastFailure()

            }

       }

    }

}

}



tagcreation Job (check assignment of day7 for details). :-

In build section select Process job DSL&#39;s

Select Use the provided DSL scripts

Enter the DSL scripts :-

freeStyleJob(&#39;Git\_Tag&#39;) {

  parameters {

stringParam(&#39;Branch\_Name&#39;, &#39;&#39;, &#39;Enter branch Name&#39;)

stringParam(&#39;Tag\_Name&#39;, &#39;&#39;, &#39;Enter tag Name&#39;)

}

    scm {

        git {

            remote {

                github(&#39;kavitnarwal/kavit\_narwal&#39;, &#39;https&#39;)

            }

        }

    }

  steps {

  shell {

command(&#39;&#39;&#39;\

#!/bin/bash

git checkout $Branch\_Name

git tag $Tag\_Name

&#39;&#39;&#39;.stripIndent())

}

  }

}



codestability Job :-

In build section select Process job DSL&#39;s

Select Use the provided DSL scripts

Enter the DSL scripts :-



mavenJob(&#39;Code\_stability\_DSL\_1&#39;) {

    scm {

        git {

            remote {

                github(&#39;OpsTree/ContinuousIntegration&#39;, &#39;https&#39;)

            }

           branch(&quot;\*/master&quot;)

        }

    }

   goals(&#39;clean compile&#39;)

  rootPOM(&#39;Spring3HibernateApp/pom.xml&#39;)

}



codecoverage Job (The all 3 jobs will be based on Java project(Spring3HibernateApp) from ContinuousIntegration.) :-

In build section select Process job DSL&#39;s

Select Use the provided DSL scripts

Enter the DSL scripts :-

mavenJob(&#39;Code\_coverage\_DSL\_1&#39;) {

    scm {

        git {

            remote {

                github(&#39;OpsTree/ContinuousIntegration&#39;, &#39;https&#39;)

            }

           branch(&quot;\*/master&quot;)

        }

    }

            goals(&#39;clean&#39;)

            goals(&#39;clean compile cobertura:cobertura&#39;)

        }



static-deployment Job for static file deployment in nginx (Deployment of static code i.e. index.html from day7 assignment). :-

In build section select Process job DSL&#39;s

Select Use the provided DSL scripts

Enter the DSL scripts :-



freeStyleJob(&#39;Deployment\_war\_by\_DSL&#39;) {

    steps {

        remoteShell(&#39;root@192.168.33.10:22&#39;) {

     command(&#39;git clone https://github.com/ot-training/jenkins.git&#39;)

     command(&#39;cp index.html /usr/local/nginx-1.13.8/html/&#39;)

     command(&#39;echo &quot;Hello Ninjas!! This is Kavit&quot; &gt; index.html&#39;)

     command(&#39;git add index.html&#39;)

     command(&#39;git commit -m &quot;Updated index.html&quot;&#39;)

     command(&#39;git tag v-1.2.0&#39;)

        }

    }

}



deployment Job for war file (Deployed into tomcat7) :-

In build section select Process job DSL&#39;s

Select Use the provided DSL scripts

Enter the DSL scripts :-



freeStyleJob(&#39;Spring3HibernateApp-deployment\_by\_DSL&#39;) {

    steps {

        remoteShell(&#39;root@192.168.33.10:22&#39;) {

     command(&#39;cd /tmp/&#39;)

     command(&#39;git clone https://github.com/ot-training/jenkins.git&#39;)

     command(&#39;cd jenkins/attendees/assignments/day7&#39;)

     command(&#39;cp index.html /usr/local/apache-tomcat-8.5.27/webapps/&#39;)

     command(&#39;echo &quot;Hello Ninjas!! This is Kavit&quot; &gt; index.html&#39;)

     command(&#39;git add index.html&#39;)

     command(&#39;git commit -m &quot;Updated index.html&quot;&#39;)

     command(&#39;git tag v-1.2.2&#39;)

        }

    }

}



Write Job DSL to Setup CI/CD (Nodejs app) Jobs :-

In build section select Process job DSL&#39;s

Select Use the provided DSL scripts

Enter the DSL scripts :-



freeStyleJob(&#39;Nodejs\_by\_dsl&#39;) {

    steps {

        remoteShell(&#39;root@192.168.33.10:22&#39;) {

     command(&#39;git clone https://github.com/kavitnarwal/node-js-sample.git&#39;)

     command(&#39;cd node-js-sample/&#39;)

     command(&#39;/usr/local/node-0.10.30/bin/npm start&#39;)

     command(&#39;cd&#39;)

     command(&#39;tar -cvf /tmp/node-js-sample.tar node-js-sample&#39;)

     command(&#39;/usr/local/node-0.10.30/bin/npm install pm2 -g&#39;)

     command(&#39;/usr/local/node-0.10.30/bin/pm2 start index.js&#39;)

        }

    }

}
