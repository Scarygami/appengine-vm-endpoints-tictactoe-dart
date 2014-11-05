boot2docker up
gcloud --verbosity=debug --project=dart-endpoints preview app deploy app.yaml
boot2docker down
