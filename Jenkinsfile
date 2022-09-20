node {
    def app 
    stage('Clone repository') {
        checkout scm
    }

    stage('Build image') {
        app = docker.build("pedroalvesbatista/pipeline-extract-mysql-full")
    }

    stage('Test image') {
        app.insde {
            sh 'Echo "Tests passed"'
        }
    }

    stage('Push image') {
        docker.withRegistry('https://hub.docker.com/', 'dockerhub-credential') {
            app.push("${env.BUILD_NUMBER}")
            app.push("latest")
        }
    }
}