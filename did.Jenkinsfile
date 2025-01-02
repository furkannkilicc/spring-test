pipeline {
    agent any
    stages {
        stage('Checkout') {
            steps {
                git url: 'https://github.com/furkannkilicc/spring-test.git', branch: 'ci/cd'
            }
        }
        stage('Build Docker Image') {
            steps {
                sh '/usr/bin/docker build -t furkantest-app2:latest .'
            }
        }
        stage('Stop and Remove Old Container') {
            steps {
                script {
                    sh '''
                    /usr/bin/docker rm -f furkantest-app2 || true
                    '''
                }
            }
        }
        stage('Run New Container') {
            steps {
                script {
                    sh '/usr/bin/docker run -d -p 8081:8081 --name furkantest-app2 furkantest-app2:latest'
                }
            }
        }
    }
}