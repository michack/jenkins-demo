pipelineJob("deploy_sentry") {
    definition {
        cps {
            script(readFileFromWorkspace('jenkins-jobs/jobs/pipeline/deploy_sentry.pipeline'))
            sandbox()
        }
    }
}
