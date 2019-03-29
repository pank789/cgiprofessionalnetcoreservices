pipeline {
  agent any
  stages {
    stage('Restore and Build') {
      steps {
        sh 'bash ./jenkins/scripts/build.sh'
      }
    }
    stage('test') {
      steps {
        sh 'bash ./jenkins/scripts/test.sh'
      }
    }
    stage('publish') {
      steps {
        sh 'bash ./jenkins/scripts/publish.sh'
      }
    }
    stage('prepare images') {
      steps {
        sh 'bash ./jenkins/scripts/prepare-image.sh'
      }
    }
    stage('push images to hub') {
      steps {
        sh 'bash ./jenkins/scripts/push-images.sh'
        sh 'bash ./jenkins/scripts/cleanup-images.sh'
      }
    }
    stage('run container') {
      steps {
        sh 'bash ./jenkins/scripts/run-container.sh'
        input(message: 'Please connect host url 9090 and verify the data', ok: 'Yes verified go ahead and clean the container')
        sh 'bash ./jenkins/scripts/cleanup-container.sh'
      }
    }
    stage('aws deploy') {
      steps {
        emailext(subject: '${JOB_NAME}', body: '${BUILD_LOG}')
        input(message: 'would you like to deploy', ok: 'yes')
        sh 'bash ./jenkins/scripts/aws-deploy.sh'
      }
    }
  }
  environment {
    CONTAINER_PORT = '9090'
    HOST_PORT = '9090'
    HOME = '.'
    DOCKER_HUB_PASSWORD = 'pank_789'
    DB_CONN_STRINg = 'ZGF0YSBzb3VyY2U9aW9tZWdhc3Fsc2VydmVydjIuZGF0YWJhc2Uud2luZG93cy5uZXQ7dXNlciBpZD1pb21lZ2FhZG1pbjtwYXNzd29yZD1QcmVzdGlnZTEyMztpbml0aWFsIGNhdGFsb2c9aW9tZWdhc3FsZGF0YWJhc2V2Mjs='
    CONTAINER_NAME = 'restservices'
    DOCKER_HUB_USER = 'pank789'
  }
}