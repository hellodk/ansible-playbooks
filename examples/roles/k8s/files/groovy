pipeline {
   agent any // 
   environment {
       dockerHub = "docker.io"
       docker_cred = 'dockerhub'
   }
   stages {
		stage('SCM Checkout'){
		steps{
			checkout([$class: 'GitSCM',branches: [[name: 'origin/master']],extensions: [[$class: 'WipeWorkspace']],userRemoteConfigs: [[url: 'https://github.com/hellodk/python-app.git']]  ])
		}
		}
		stage("Build Docker Image"){
			steps{
			sh 'pwd'
			//sh 'cd helloworld'
			sh "docker build -t hellodk/test-app . --no-cache"
		}}
		stage('Upload Image to DockerHub'){
			steps{
				//String dockerHub = 'https://registry.hub.docker.com'
	     	    //withCredentials([string(credentialsId: 'dockerpass', variable: 'dockerhub')]) {
	     	    withCredentials([
      [$class: 'UsernamePasswordMultiBinding', credentialsId: docker_cred, usernameVariable: 'dockeruser', passwordVariable: 'dockerpass'],
  ]){
				sh "docker login -u ${dockeruser} -p ${dockerpass} ${dockerHub}"
  }
	    	  sh 'docker push hellodk/test-app'
	    	  }
	  	}
		stage("Running Docker Image"){
		steps{
			sh "kubectl get namespaces"
			sh "kubectl apply -f deployment.yaml"
		}
		}
}
}