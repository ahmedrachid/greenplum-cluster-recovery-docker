# gpdb-6.23-docker

1. Start docker compose, run containers:
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
  gpcr info
  gpcr restore --restore-point **** 
  gpstart -qa 
  psql demo
    
 ```
  
