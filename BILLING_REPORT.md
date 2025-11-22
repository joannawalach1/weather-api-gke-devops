# Estimated costs report
Report of the estimated costs of the **weather-api** app created as a project for the GCP training, by Gałuszkiewicz Katarzyna, Kwolek Emilia, Morawska Katarzyna and Wałach Joanna.

## Resources used

- GKE Standard, regional cluster in the **us-central1** region
- in the cluster - 3 e2-small nodes working 24/7 in the zones **us-central1-a, us-central1-b, us-central1-c**
- Cloud build trigger, billed for build time, run on push to the main branch in the github repository
- Docker images stored in Artifact Registry
- Cloud Operations enabled for logging and monitoring
- External HTTP(S) Load Balancer

Some resources are billed based on usage, therefore the raport holds only the estimates, based on the predicted usage.


## Cost breakdown


### GKE Cluster

- cluster control plane costs $0.10 per hour, at 720 hours per month → $72 / month

- worker nodes (3× e2-small) cost $0.0168 per hour per node in the **us-central1** region, coming to 3 × 0.0.0168 × 720 → $36.288  / month

GKE total: ~$90.09 / month

### Cloud Build

- cloud build gets triggered on push to the main branch, which - while it happens often during development - should not be happening as often once this phase is finished. With the difficult question of the estimate of future repository, we set 20 as our number.

- at $0.006 per build-minute, with a singular build lasting 3 minutes, based on the existing bulid history

- we estimate a rough 20 builds per month, 20 × 3 minutes = 60 minutes, coming to 60 × 0.006 → $0.36 / month

Cloud Build total: $0.36 / month

### Artifact Registry

- The current size of our Registry is less than 300 MB, yet we would like to measure up, in order to take under account possible futer growth, leaving us with estimated 5 GB

- at approximate cost $0.02 / GB per month for 5 GB storage → $0.10 / month

Artifact Registry total: $0.10 / month

### Cloud Operations Suite

- Logging ~15 GB / month

- After free tier → approx. $5–8 / month

- Monitoring

- ~300 MiB metrics ingestion

- After free tier → approx. $22–25 / month

Cloud Operations total: ~$27–33 / month

### Load Balancer / Networking

- External HTTP(S) Load Balancer's cost is based on usage. We expect only light trafic to our app

- this would amount to ~$5–15 / month

Load Balancer total: ~$5–15 / month

## Summary
Total Estimated Monthly Cost

| Category | Cost |
|---|---|
|GKE (cluster + nodes)|	~$108.29|
|Cloud Build	|~$0.36|
|Artifact Registry	|~$0.10|
|Cloud Logging	|~$5–8|
|Cloud Monitoring	|~$22–25|
|Load Balancer / Networking|	~$5–15|
|**Total**|~$140-156|