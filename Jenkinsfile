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
                            sh 'printenv'
                            sh 'docker build -t khizarsheraz/devsecops:""$GIT_COMMIT"" .'

                            } 
                        }
                        
                }        
        } 


