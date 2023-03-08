# gpdb-6.23-docker

1. Start docker containers:
```bash
docker compose up
```
2. On primary cluster, run:
```bash
  docker compose exec -ti gpdb-primary-cluster bash
  /home/gpadmin/script.sh
  ```
3. On DR cluster, run:
  ```bash
  docker compose exec -ti gpdb-disaster-recovery-cluster bash
  /home/gpadmin/script.sh
  su - gpadmin
 ```
4. We have automated the backup creation, you can now restore the primary cluster to DR cluster, run:
  ```bash
  # Pick the restore-point id by running:
  gpcr info
  # Restore your GPDB
  gpcr restore --restore-point **** 
  # Start the DR cluster
  gpstart -qa 
  # Connect to it
  psql demo
   ```
