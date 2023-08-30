pipeline {
                agent any
                stages {
                    stage('Build Artifact - Maven') {
                        steps {
                            sh "mvn clean package -DskipTests=true"
                            sh "hostname"
                            archive 'target/*.jar'
                        }
                        }

                    stage('Unit Tests - JUnit and JaCoCo') {
                        steps {
                            sh "mvn test"
                        }
                        post { 
                        always { 
                          junit 'target/surefire-reports/*.xml'
                          jacoco execPattern: 'target/jacoco.exec'
                        }
                        }
                    }

                    stage('Docker Build and Push') {
                        steps {
                            withDockerRegistry([credentialsId: "dockerhub", url: "https://hub.docker.com/repository/docker/khizarsheraz/devsecops/"]) {
                            sh 'printenv'
                            sh 'docker build -t khizarsheraz/devsecops:""$GIT_COMMIT"" .'
                            sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
                            sh 'docker push khizarsheraz/devsecops:""$GIT_COMMIT""'
                            } 
                        }
                        }        
        } 
}

