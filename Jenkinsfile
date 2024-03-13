//Jenkinsfile (선언적 파이프라인)

pipeline {
    agent any
    stages {
        // git 에서 소스 다운로드
        stage('Git Checkout') {
            steps {
                sh 'echo "=== Git Clone ==="'
                git credentialsId: 'Github',
                    branch: 'master',
                    url: 'https://github.com/dlfghk1996/server.docker.git'
            }

            // 스테이지가 끝난 이후의 결과에 따른 후속 조치
            post {
                failure {
                    sh 'echo "Fail Cloned Repository"'
                }
            }
        }
    }
}
