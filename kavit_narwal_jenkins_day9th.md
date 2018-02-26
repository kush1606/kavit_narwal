Create a scripted pipeline that will containe different stages of a CI/CD pipeline. Include all CI and CD jobs. :-



Insert manual approval before deployment job. :-

Restrict manual approval for a specific user :-



Create a new item with type pipeline.



Select pipeline ----&gt; Definition -----&gt; Pipeline script

stage &#39;Get Code&#39;

  build &#39;test-dsl&#39;

stage &#39;Code Stability&#39;

  build &#39;test\_ssh&#39;

input message: &quot;Approve deployment?&quot; , submitter: &quot;kavit&quot;

stage &#39;Code Quality&#39;

  build &#39;Git\_clone&#39;

Create a declarative CI pipeline :-

pipeline {

    agent any

    stages {

        stage(&#39;test-dsl&#39;) {

            steps {

                build job: &#39;test-dsl&#39;

            }

        }

        stage(&#39;test\_ssh&#39;){

            steps {

                build job: &#39;test\_ssh&#39;

            }

        }

        stage(&#39;Git\_clone&#39;) {

        steps {

            build job: &#39;Git\_clone&#39;

        }

        }

    }

}
