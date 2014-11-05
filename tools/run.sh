boot2docker up
gcloud --verbosity=debug --project=dart-endpoints preview app run app.yaml
boot2docker down
