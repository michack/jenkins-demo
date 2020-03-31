pipelineJob("general_builder") {
    parameters {
        stringParam("APP_NAME", "webapp-demo", "application name")
        stringParam("APP_REPO_URL", "https://github.com/michack/webapp-demo.git", "application repo url")
        stringParam("APP_REPO_BRANCH", "master", "application branch")
        stringParam("APP_DOCKERFILE", "Dockerfile", "path to docker file")
        stringParam("APP_MANIFESTS_DIR", "k8s/", "path to k8s manifests")
    }
    definition {
        cps {
            script(readFileFromWorkspace('jenkins-jobs/jobs/pipeline/general_builder.pipeline'))
            sandbox()
        }
    }
}