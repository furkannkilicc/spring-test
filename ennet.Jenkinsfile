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
                sh '/usr/local/bin/docker build -t furkantest-app2:latest .'
            }
        }

        stage('Stop and Remove Old Container') {
            steps {
                script {
                    // Eğer konteyner varsa durdur ve sil
                    sh '''
                    if [ $(/usr/local/bin/docker ps -q -f name=furkantest-app2) ]; then
                        /usr/local/bin/docker stop furkantest-app2
                        /usr/local/bin/docker rm furkantest-app2
                    fi
                    '''
                }
            }
        }

        stage('Run New Container') {
            steps {
                script {
                    // Yeni konteyneri çalıştır
                    sh '/usr/local/bin/docker run -d -p 8081:8081 --name furkantest-app2 furkantest-app2:latest'
                }
            }
        }
    }
}