library identifier: 'pfpt-ci-pipeline@1.x', changelog: false, retriever: modernSCM(
        [$class: 'GitSCMSource',
        remote: 'https://hq-stash.corp.proofpoint.com/scm/infra/pfpt-ci-pipeline.git'])

pipeline {
    agent { label "harness" }
    stages {
        stage('Build') {
            agent {
                docker {
                    image 'gcr.io/kaniko-project/executor:debug'
                    args '--entrypoint="" -u 0:0 -v ${WORKSPACE}:/code'

                }
            }
            environment {
                ARTIFACTORY_APIKEY     = credentials('cicd-repo-writer')
            }
            steps {
                sh '''
                mkdir -p /kaniko/.docker
                set +x
                echo "{\\"auths\\":{\\"repocache.nonprod.ppops.net\\":{\\"auth\\":\\"\$(echo -n \${ARTIFACTORY_APIKEY}|base64)\\"}}}" > /kaniko/.docker/config.json
                set -x
                /kaniko/executor --force --context /code --dockerfile /code/Dockerfile --destination repocache.nonprod.ppops.net/dev-voltron-docker-local/k8s-golang-code-generator:\${GIT_BRANCH}
                '''
            }
        }
    }
  	post {
    	always {
      		finishPipeline()
   		}
  	}
}


