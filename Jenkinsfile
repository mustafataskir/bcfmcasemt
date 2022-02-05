def img
pipeline{
    environment{
        registry = "sirmontgenie/bcfmcasemt"
        registryCredential = credentials("docker_hub_login")
        dockerImage = ""
        
    }
        agent any
        
        stages{
            stage("build checkout"){
                steps {
                    echo "checkout adımındayım"
                    git 'https://github.com/sirmontgenie/bcfmcasemt.git'
                   
                }
            }
            
            stage ("build image"){
                steps {
                    echo "build image adımındayım"
                    script {
                        img = registry + ":${env.BUILD_ID}"
                        println ("${img}")
                        dockerImage = docker.build ("${img}")
                    }
                }
            }
            
            stage ("Testing"){
                
                steps {
                    echo "test adımındayım"
                    sh "docker run -d --name ${JOB_NAME} -p 5000:5000 ${img}"
                }
                
            }
            
            stage ("push to docker hub"){
                steps{
                    echo "push adımındayım"
                    script{
                        docker.withRegistry("https://registry.hub.docker.com", registryCredential){
                            dockerImage.push()
                        }
                    }
                }
                
            }
            
            
        }
}
