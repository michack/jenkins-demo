pipelineJob("specialized_builder") {
    parameters {
        stringParam("APP_NAME", "sentry", "application name")
        stringParam("APP_REPO_URL", "https://github.com/getsentry/sentry.git", "application repo url")
        stringParam("APP_REPO_BRANCH", "master", "application branch")
        stringParam("APP_DOCKERFILE", "docker/Dockerfile", "path to docker file")
    }
    definition {
        cps {
            script(readFileFromWorkspace('jenkins-jobs/jobs/pipeline/specialized_builder.pipeline'))
            sandbox()
        }
    }
}
